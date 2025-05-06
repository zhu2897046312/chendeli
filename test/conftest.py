import pytest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import os
import time


@pytest.fixture(scope="session")
def driver():
    # 设置 Chrome 选项
    chrome_options = Options()
    # chrome_options.add_argument('--headless')  # 无头模式
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')

    # 指定 ChromeDriver 路径
    chrome_driver_path = r"C:\Program Files\Google\Chrome\Application\chromedriver.exe"
    service = Service(executable_path=chrome_driver_path)
    
    # 初始化 WebDriver
    driver = webdriver.Chrome(service=service, options=chrome_options)
    driver.implicitly_wait(10)
    
    # 创建截图目录（使用绝对路径）
    screenshot_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'screenshots')
    if not os.path.exists(screenshot_dir):
        os.makedirs(screenshot_dir)
    
    yield driver
    
    driver.quit()

# 可以添加更多公共 fixture
@pytest.fixture
def screenshot_dir():
    """返回截图保存目录的路径"""
    return os.path.join(os.path.dirname(os.path.abspath(__file__)), 'screenshots')

@pytest.fixture
def login(driver):
    """登录 fixture"""
    def _login():
        try:
            driver.get("http://localhost:8081/login")
            time.sleep(2)  # 等待页面加载
            
            # 等待登录表单加载
            form = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, ".login-card .el-form"))
            )
            
            # 使用更精确的选择器，匹配实际的登录页面结构
            email_input = form.find_element(By.CSS_SELECTOR, "input[placeholder='邮箱']")
            password_input = form.find_element(By.CSS_SELECTOR, "input[placeholder='密码']")
            
            # 清除并输入
            email_input.clear()
            email_input.send_keys("ahjj5018@qq.com")
            password_input.clear()
            password_input.send_keys("123456")
            
            # 点击登录按钮
            submit_button = form.find_element(By.CSS_SELECTOR, "button.el-button--primary")
            submit_button.click()
            
            # 等待登录成功跳转到仪表盘
            WebDriverWait(driver, 10).until(
                EC.url_contains("/dashboard")
            )
            
            # 额外等待��保完全加载
            time.sleep(2)
            
        except Exception as e:
            # 保存错误截图
            driver.save_screenshot('./screenshots/login_error.png')
            print("登录失败，错误信息：", str(e))  # 添加错误信息打印
            raise e
            
    return _login

@pytest.fixture(autouse=True, scope="function")
def setup_test():
    """这个fixture会自动在每个测试用例前后运行"""
    # 测试用例开始前的代码
    print("测试开始")
    
    yield  # 运行测试用例
    
    # 测试用例结束后的代码
    print("测试结束，等待5秒")
    time.sleep(5)