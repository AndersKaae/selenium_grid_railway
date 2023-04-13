import asyncio
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

async def main():
    # Set up the driver
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    prefs = {"profile.managed_default_content_settings.images":2}
    chrome_options.headless = True

    chrome_options.add_experimental_option("prefs", prefs)
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)

    # Navigate to Google and search for a query
    driver.get('https://www.google.com/')
    
    # Wait for the results to load
    await asyncio.sleep(5)

    # Extract the search results
    print(driver.page_source)

    # Quit the driver
    driver.quit()

if __name__ == '__main__':
    asyncio.run(main())