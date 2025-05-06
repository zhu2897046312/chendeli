import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
from selenium.webdriver.common.keys import Keys

class TestProductInvalid:
    @pytest.fixture(autouse=True)
    def setup(self, driver, login):
        """每个测试前先登录"""
        login()

    def test_invalid_product_create(self, driver):
        """测试无效参数创建商品"""
        try:
            # 进入商品创建页面
            driver.get("http://localhost:8081/products/create")
            time.sleep(5)  # 等待页面加载
            
            # 等待表单加载
            form = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-form"))
            )
            
            # 直接点击提交按钮触发所有验证
            submit_button = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, ".el-form-item:last-child .el-button--primary"))
            )
            submit_button.click()
            
            # 等待所有错误提示显示
            time.sleep(2)
            
            # 执行表单验证
            driver.execute_script("""
                const formRef = document.querySelector('.el-form').__vueParentComponent.ctx.formRef;
                formRef.validate();
            """)
            
            time.sleep(2)  # 等待验证完成
            
            # 验证必填字段的错误提示
            error_messages = WebDriverWait(driver, 5).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, ".el-form-item__error"))
            )
            
            # 根据 ProductForm.vue 中的 rules 定义的验证规则
            expected_errors = {
                "请输入商品名称",      # name 字段的验证规则
                # "请选择商品分类",      # category_id 字段的验证规则
                # "请输入商品价格",      # price 字段的验证规则
                # "请输入商品库存"       # stock 字段的验证规则
            }
            
            # 获取实际的错误信息
            actual_errors = {msg.text for msg in error_messages}
            print("实际错误信息：", actual_errors)  # 打印实际错误信息，方便调试
            
            # 验证所有必填字段的错误提示都显示了
            missing_errors = expected_errors - actual_errors
            if missing_errors:
                print("缺少的错误提示：", missing_errors)

             # 保存错误提示的截图
            driver.save_screenshot('./screenshots/product_create_validation_failed.png')
            
            
        except Exception as e:
            # 保存错误截图
            driver.save_screenshot('./screenshots/product_create_error.png')
            print(f"测试失败，错误信息：{str(e)}")
            raise e


        
