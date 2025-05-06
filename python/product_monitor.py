import requests
import pandas as pd
import schedule
import time
from datetime import datetime
from bs4 import BeautifulSoup
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

class ProductMonitor:
    def __init__(self):
        self.base_url = os.getenv('API_BASE_URL', 'http://localhost:8080')
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        self.data = []

    def fetch_products(self):
        """Fetch product data from API"""
        try:
            # Fetch product list
            response = requests.get(f"{self.base_url}/api/products", headers=self.headers)
            response.raise_for_status()
            products = response.json()

            for product in products:
                # Fetch reviews for each product
                reviews_response = requests.get(
                    f"{self.base_url}/api/products/{product['id']}/reviews",
                    headers=self.headers
                )
                reviews = reviews_response.json() if reviews_response.status_code == 200 else []

                # Calculate average rating
                avg_rating = sum(review['rating'] for review in reviews) / len(reviews) if reviews else 0

                product_data = {
                    'id': product['id'],
                    'name': product['name'],
                    'category': product['category'],
                    'price': product['price'],
                    'status': product['status'],
                    'description': product['description'],
                    'review_count': len(reviews),
                    'average_rating': round(avg_rating, 2),
                    'last_updated': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                }
                self.data.append(product_data)

        except requests.RequestException as e:
            print(f"Error fetching data: {str(e)}")
            return False
        return True

    def save_to_excel(self):
        """Save the scraped data to Excel file"""
        if not self.data:
            print("No data to save")
            return

        try:
            df = pd.DataFrame(self.data)
            filename = f"product_data_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
            df.to_excel(filename, index=False, engine='openpyxl')
            print(f"Data saved to {filename}")
            self.data = []  # Clear data after saving
        except Exception as e:
            print(f"Error saving to Excel: {str(e)}")

    def monitor(self):
        """Main monitoring function"""
        print(f"Starting monitoring at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        if self.fetch_products():
            self.save_to_excel()

def main():
    monitor = ProductMonitor()
    
    # Run immediately on start
    monitor.monitor()
    
    # Schedule to run every hour
    schedule.every(1).hour.do(monitor.monitor)
    
    while True:
        schedule.run_pending()
        time.sleep(60)

if __name__ == "__main__":
    main()
