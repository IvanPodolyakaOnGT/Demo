from selenium import webdriver
from selenium.webdriver.common.by import By
import time 

# обращается к указанному файлу и забирает ссылку на платежную форму
with open("C:\\environments\\Project\\fixtures\\LinkTestKorp.txt", "r") as f:
    link = f.readline()
    card = f.readlines(2)
    n = f.readline(3)
linkall = link.split("/")
la = linkall[-1]

try:
  for i in range(int(n)):
    # url использует конкатенацию строк с прибавлением цикла
    count = int(la) + i
    a = 'https://*/*/' # * NDA
    b = str(count)
    
    link1 = a + b
    browser = webdriver.Chrome()
    browser.implicitly_wait(10)
    browser.get(link1)
        
    input1 = browser.find_element(By.NAME, "CardNumber")
    input1.send_keys(card)
    input2 = browser.find_element(By.XPATH, "//*[@name='date']")
    input2.send_keys("11/25")
    input3 = browser.find_element(By.XPATH, "//*[@name='CardCvv']")
    input3.send_keys("111")
    input4 = browser.find_element(By.XPATH, "//*[@name='CardHolder']")
    input4.send_keys("Q E")
    button = browser.find_element(By.XPATH, "//*[@type='submit']")
    button.click()
    time.sleep(3)
  
finally:
    # ожидание отправки запроса
    time.sleep(20)
    # закрытие браузера 
    browser.quit()

# пустая последняя строка нам нужна