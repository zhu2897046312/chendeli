import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

class TestProductPage:
    def login(self, driver):
        """登录方法"""
        try:
            driver.get("http://localhost:8081/login")
            time.sleep(2)
            
            form = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".login-card .el-form"))
            )
            
            email_input = form.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
            password_input = form.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
            
            email_input.clear()
            email_input.send_keys("ahjj5018@qq.com")
            password_input.clear()
            password_input.send_keys("123456")
            
            submit_button = form.find_element(By.CSS_SELECTOR, "button.el-button--primary")
            submit_button.click()
            
            WebDriverWait(driver, 10).until(
                EC.url_contains("/dashboard")
            )
            time.sleep(2)
            
        except Exception as e:
            driver.save_screenshot('./screenshots/login_error.png')
            print("登录失败，错误信息：", str(e))
            raise e

    def test_product_create_page_loads(self, driver):
        """测试商品创建页面加载"""
        try:
            self.login(driver)
            
            driver.get("http://localhost:3000/products/create")
            time.sleep(5)
            
            form = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form"))
            )
            assert form.is_displayed(), "表单未显示"
            
            form_items = {
                "商品名称": ".el-form-item input[placeholder='请输入商品名称']",
                "商品分类": ".el-select[placeholder='请选择商品分类']",
                "商品价格": ".el-form-item:nth-child(3) .el-input-number__input",
                "商品库存": ".el-form-item:nth-child(4) .el-input-number__input",
                "商品描述": ".el-form-item textarea[placeholder='请输入商品描述']",
                "商品状态": "[data-test='status-active']"
            }
            
            for label, selector in form_items.items():
                try:
                    element = WebDriverWait(driver, 5).until(
                        EC.presence_of_element_located((By.CSS_SELECTOR, selector))
                    )
                    assert element.is_displayed(), f"{label}字段未显示"
                except Exception as e:
                    print(f"无法找到{label}字段: {selector}")
                    driver.save_screenshot(f'./screenshots/error_{label}.png')
                    raise e
            
            driver.save_screenshot('./screenshots/product_create_page.png')
            
        except Exception as e:
            driver.save_screenshot('./screenshots/product_create_page_error.png')
            raise e 