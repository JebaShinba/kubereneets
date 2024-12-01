from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def test_google():
    driver = webdriver.Chrome()
    driver.get("https://www.google.com")
    assert "Google" in driver.title

    search_box = driver.find_element(By.NAME, "q")
    search_box.send_keys("Kubernetes CI/CD")
    search_box.submit()

    time.sleep(2)
    assert "Kubernetes CI/CD" in driver.page_source
    driver.quit()

if __name__ == "__main__":
    test_google()
