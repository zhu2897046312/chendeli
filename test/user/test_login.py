import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
import os

class TestLogin:
    def test_login_page_loads(self, driver):
        """测试登录页面加载"""
        driver.get("http://localhost:8081/login")
        assert "Admin Dashboard" in driver.title
        
        email_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
        password_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
        login_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        
        assert email_input.is_displayed()
        assert password_input.is_displayed()
        assert login_button.is_displayed()
        
        driver.save_screenshot('./screenshots/login_page.png')

    def test_invalid_login(self, driver):
        """测试无效登录"""
        driver.get("http://localhost:8081/login")
        
        email_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
        password_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
        login_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        
        email_input.send_keys("invalid@example.com")
        password_input.send_keys("wrongpassword")
        login_button.click()
        
        error_message = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CLASS_NAME, "el-message--error"))
        )

        driver.save_screenshot('./screenshots/login_failed.png')
        
    def test_valid_login(self, driver):
        """测试有效登录"""
        driver.get("http://localhost:8081/login")
        
        email_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
        password_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
        login_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        
        email_input.send_keys("ahjj5018@qq.com")
        password_input.send_keys("123456")
        login_button.click()
        
        WebDriverWait(driver, 5).until(
            EC.url_to_be("http://localhost:8081/dashboard")
        )
        
        driver.save_screenshot('./screenshots/login_success.png') 