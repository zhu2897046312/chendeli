import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class TestRegister:
    def test_register_page_loads(self, driver):
        """测试注册页面加载"""
        driver.get("http://localhost:8081/register")
        
        email_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
        nickname_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='昵称']")
        password_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
        confirm_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='确认密码']")
        register_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        
        
        driver.save_screenshot('./screenshots/register_page.png')

    def test_invalid_register(self, driver):
        """测试无效注册"""
        driver.get("http://localhost:8081/register")
        
        email_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
        password_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
        confirm_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='确认密码']")
        register_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        
        # 测试密码不一致
        email_input.send_keys("test@example.com")
        password_input.send_keys("123456")
        confirm_input.send_keys("654321")
        register_button.click()
        
        error_message = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CLASS_NAME, "el-form-item__error"))
        )

        driver.save_screenshot('./screenshots/register_failed.png')

    def test_valid_register(self, driver):
        """测试有效注册"""
        driver.get("http://localhost:8081/register")
        
        email_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
        nickname_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='昵称']")
        password_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
        confirm_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='确认密码']")
        register_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        
        email_input.send_keys("test@example.com")
        nickname_input.send_keys("测试用户")
        password_input.send_keys("123456")
        confirm_input.send_keys("123456")
        register_button.click()
        
        WebDriverWait(driver, 5).until(
            EC.url_to_be("http://localhost:8081/dashboard")
        )
        
        driver.save_screenshot('./screenshots/register_success.png') 