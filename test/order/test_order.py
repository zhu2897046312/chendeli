import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
from selenium.webdriver.common.keys import Keys

class TestOrder:
    @pytest.fixture(autouse=True)
    def setup(self, driver, login):
        """每个测试前先登录"""
        login()
        yield
        # 测试后清理工作（如果需要）
        driver.delete_all_cookies()

    def test_order_list(self, driver):
        """测试订单列表"""
        driver.get("http://localhost:8081/orders")
        
        # 验证页面元素
        order_table = driver.find_element(By.CSS_SELECTOR, ".el-table")
        assert order_table.is_displayed()
        
        # 验证搜索功能
        search_input = driver.find_element(By.CSS_SELECTOR, "input[placeholder='请输入订单号']")
        search_input.send_keys("ORD2023")
        search_button = driver.find_element(By.CSS_SELECTOR, "button.el-button--primary")
        search_button.click()
        
        # 等待搜索结果
        WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".el-table__row"))
        )
        
        driver.save_screenshot('./screenshots/order_list.png')
