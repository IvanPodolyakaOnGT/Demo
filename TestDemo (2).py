from selenium import webdriver
from selenium.webdriver.common.by import By
import time 
from selenium.common.exceptions import NoSuchElementException

# обращается к указанному файлу и забирает ссылку на платежную форму
with open("C:\\environments\\Project\\LinkApiPy.txt", "r") as f:
    link = f.read()

try:
    browser = webdriver.Chrome()
    browser.implicitly_wait(20)
    browser.get(link)
    
    now = time.time()
    while True and now + 50 > time.time():
        try:
            browser.find_element(By.NAME, "CardNumber")
            break
        except NoSuchElementException:
            browser.refresh()

    input1 = browser.find_element(By.NAME, "CardNumber")
    input1.send_keys("*") # * NDA
    input2 = browser.find_element(By.XPATH, "//*[@name='date']")
    input2.send_keys("11/25")
    input3 = browser.find_element(By.XPATH, "//*[@name='CardCv']")
    input3.send_keys("641")
    time.sleep(3)
    button = browser.find_element(By.XPATH, "//*[@type='submit']")
    button.click()
    time.sleep(20)
    
except:
    allert = open("C:\\environments\\Project\\fixtures\\ScriptError.txt", "w+")
    allert.write('false')
    allert.close()

finally:
    # закрытие браузера 
    browser.quit()

# пустая последняя строка нам нужна