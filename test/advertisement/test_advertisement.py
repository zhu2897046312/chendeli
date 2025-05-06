import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

class TestAdvertisement:
    @pytest.fixture(autouse=True)
    def setup(self, driver, login):
        """每个测试前先登录"""
        login()
        yield
        # 测试后清理工作（如果需要）
        driver.delete_all_cookies()

    def test_advertisement_page_loads(self, driver):
        """测试广告页面加载"""
        try:
            # 进入广告页面
            driver.get("http://localhost:8081/advertisements")
            time.sleep(2)
            
            # 等待页面加载完成
            table = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".el-table"))
            )
            assert table.is_displayed(), "广告列表未显示"
            
            # 验证创建按钮存在
            create_button = WebDriverWait(driver, 5).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "button.el-button--primary"))
            )
            #assert create_button.is_displayed(), "创建按钮未显示"
            
            # 保存页面截图
            driver.save_screenshot('./screenshots/advertisement_page.png')
            
        except Exception as e:
            driver.save_screenshot('./screenshots/advertisement_page_error.png')
            print(f"页面加载失败：{str(e)}")
            raise e

    # def test_create_advertisement(self, driver):
    #     """测试创建广告"""
    #     try:
    #         # 进入广告页面
    #         driver.get("http://localhost:3000/advertisements")
    #         time.sleep(2)
            
    #         # 点击创建按钮
    #         create_button = WebDriverWait(driver, 5).until(
    #             EC.element_to_be_clickable((By.CSS_SELECTOR, "button.el-button--primary"))
    #         )
    #         create_button.click()
            
    #         # 等待对话框显示
    #         dialog = WebDriverWait(driver, 5).until(
    #             EC.presence_of_element_located((By.CLASS_NAME, "el-dialog"))
    #         )
            
    #         # 填写表单
    #         # 标题
    #         title_input = dialog.find_element(By.CSS_SELECTOR, "input[placeholder='请输入标题']")
    #         title_input.send_keys("测试广告")
            
    #         # 链接
    #         url_input = dialog.find_element(By.CSS_SELECTOR, "input[placeholder='请输入链接']")
    #         url_input.send_keys("http://example.com")
            
    #         # 选择位置
    #         position_select = dialog.find_element(By.CSS_SELECTOR, ".el-select")
    #         position_select.click()
    #         time.sleep(1)
            
    #         position_option = WebDriverWait(driver, 5).until(
    #             EC.element_to_be_clickable((By.CSS_SELECTOR, ".el-select-dropdown__item"))
    #         )
    #         position_option.click()
            
    #         # 选择时间范围
    #         date_picker = dialog.find_element(By.CSS_SELECTOR, ".el-date-picker__editor-wrap input")
    #         date_picker.click()
    #         time.sleep(1)
            
    #         # 选择默认时间范围
    #         driver.execute_script("""
    #             const dateInput = document.querySelector('.el-date-picker__editor-wrap input');
    #             dateInput.value = '2024-01-01 00:00:00 - 2024-12-31 23:59:59';
    #             dateInput.dispatchEvent(new Event('change'));
    #         """)
            
    #         # 选择状态
    #         status_radio = dialog.find_element(By.CSS_SELECTOR, ".el-radio__input input[type='radio']")
    #         status_radio.click()
            
    #         # 保存表单截图
    #         driver.save_screenshot('./screenshots/advertisement_create_form.png')
            
    #         # 提交表单
    #         submit_button = dialog.find_element(By.CSS_SELECTOR, ".el-dialog__footer .el-button--primary")
    #         submit_button.click()
            
    #         # 等待成功提示
    #         success_message = WebDriverWait(driver, 5).until(
    #             EC.presence_of_element_located((By.CLASS_NAME, "el-message--success"))
    #         )
    #         #assert "成功" in success_message.text
            
    #         # 保存成功截图
    #         driver.save_screenshot('./screenshots/advertisement_create_success.png')
            
    #     except Exception as e:
    #         driver.save_screenshot('./screenshots/advertisement_create_error.png')
    #         print(f"创建广告失败：{str(e)}")
    #         raise e

    # def test_delete_last_advertisement(self, driver):
    #     """测试删除最后一个广告"""
    #     try:
    #         # 进入广告页面
    #         driver.get("http://localhost:3000/advertisements")
    #         time.sleep(2)
            
    #         # 等待表格加载
    #         table = WebDriverWait(driver, 10).until(
    #             EC.presence_of_element_located((By.CSS_SELECTOR, ".el-table"))
    #         )
            
    #         # 找到最后一行的删除按钮
    #         delete_button = table.find_elements(By.CSS_SELECTOR, ".el-button--danger")[-1]
    #         delete_button.click()
            
    #         # 等待确认对话框
    #         confirm_button = WebDriverWait(driver, 5).until(
    #             EC.element_to_be_clickable((By.CSS_SELECTOR, ".el-message-box__btns .el-button--primary"))
    #         )
            
    #         # 保存删除确认框截图
    #         driver.save_screenshot('./screenshots/advertisement_delete_confirm.png')
            
    #         # 确认删除
    #         confirm_button.click()
            
    #         # 等待成功提示
    #         success_message = WebDriverWait(driver, 5).until(
    #             EC.presence_of_element_located((By.CLASS_NAME, "el-message--success"))
    #         )
    #         #assert "成功" in success_message.text
            
    #         # 保存删除成功截图
    #         driver.save_screenshot('./screenshots/advertisement_delete_success.png')
            
    #     except Exception as e:
    #         driver.save_screenshot('./screenshots/advertisement_delete_error.png')
    #         print(f"删除广告失败：{str(e)}")
    #         raise e