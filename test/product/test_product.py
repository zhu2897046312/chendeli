import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
from selenium.webdriver.common.keys import Keys

class TestProduct:
    @pytest.fixture(autouse=True)
    def setup(self, driver, login):
        """每个测试前自动登录"""
        login()  # 使用公共的login fixture
        yield
        # 测试后清理工作（如果需要）
        driver.delete_all_cookies()

    def test_product_create_page_loads(self, driver):
        """测试商品创建页面加载"""
        try:
            
            # 进入商品创建页面
            driver.get("http://localhost:8081/products/create")
            time.sleep(5)  # 等待页面跳转完成
            
            # 等待表单加载完成
            form = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form"))
            )
            assert form.is_displayed(), "表单未显示"
            
            # 验证所有表单字段是否存在并可见
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
            
            # 保存成功截图
            driver.save_screenshot('./screenshots/product_create_page.png')
            
        except Exception as e:
            # 保存错误截图
            driver.save_screenshot('./screenshots/product_create_page_error.png')
            raise e
    
    def test_valid_product_create(self, driver):
        """测试有效参数创建商品"""
        try:
            # login(driver)
            
            # 进入商品创建页面
            driver.get("http://localhost:3000/products/create")
            time.sleep(5)  # 等待页面加载
            
            # 等待表单加载
            form = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form"))
            )
            
            # 填写商品名称
            name_input = WebDriverWait(driver, 5).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form-item:nth-child(1) .el-input input"))
            )
            name_input.clear()
            name_input.send_keys("测试商品")
            
            # 选择商品分类
            category_select = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, ".el-form-item:nth-child(2) .el-select"))
            )
            category_select.click()
            time.sleep(2)  # 等待下拉菜单展开
            
            # 选择第一个分类选项
            option = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, ".el-select-dropdown:not(.is-hidden) .el-select-dropdown__item"))
            )
            option.click()
            time.sleep(2)  # 等待选择生效
            
            # 设置商品价格
            price_input = WebDriverWait(driver, 5).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form-item:nth-child(3) .el-input-number input"))
            )
            price_input.clear()
            price_input.send_keys("99.99")
            price_input.send_keys(Keys.ENTER)
            
            # 设置商品库存
            stock_input = WebDriverWait(driver, 5).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form-item:nth-child(4) .el-input-number input"))
            )
            stock_input.clear()
            stock_input.send_keys("100")
            stock_input.send_keys(Keys.ENTER)
            
            # 填写商品描述
            description = WebDriverWait(driver, 5).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form-item textarea"))
            )
            description.clear()
            description.send_keys("这是一个测试商品描述")
            
            # 选择商品状态（上架）
            status_radio = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, "[data-test='status-active']"))
            )
            status_radio.click()
            time.sleep(1)
            
            # 提交表单
            submit_button = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, "button.el-button--primary"))
            )
            submit_button.click()
            
            # 等待提交完成并跳转
            WebDriverWait(driver, 10).until(
                EC.url_contains("/products")
            )
            
        except Exception as e:
            # 保存错误截图
            driver.save_screenshot('./screenshots/product_create_error.png')
            print(f"创建商品失败，错误信息：{str(e)}")
            raise e
            
        # 成功截图
        driver.save_screenshot('./screenshots/product_create_success.png')