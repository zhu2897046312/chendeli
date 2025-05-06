# Product Monitor

This Python script monitors product information and reviews from the website and saves the data to Excel files.

## Features

- Automatically fetches product information and reviews
- Calculates average ratings and review counts
- Saves data to Excel files with timestamps
- Runs hourly monitoring schedule
- Handles errors gracefully

## Setup

1. Install the required packages:
```bash
pip install -r requirements.txt
```

2. Create a `.env` file in the same directory with the following content:
```
API_BASE_URL=http://your-api-url
```

## Usage

Run the script:
```bash
python product_monitor.py
```

The script will:
1. Immediately fetch current product data
2. Save it to an Excel file
3. Continue monitoring hourly
4. Create new Excel files with timestamps for each run

## Output

Excel files will be created in the same directory with names like:
`product_data_20241218_203000.xlsx`

Each file contains:
- Product ID
- Name
- Category
- Price
- Status
- Description
- Review Count
- Average Rating
- Last Updated Timestamp
