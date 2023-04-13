from extract import createDriver, getGoogleHomepage

driver=createDriver()

homepage = getGoogleHomepage(driver)
driver.close()
print(homepage)