from extract import createDriver, getGoogleHomepage
import asyncio

async def demo_get():
    driver=createDriver()
    homepage = getGoogleHomepage(driver)
    driver.close()
    return homepage

subroutine = demo_get()

test = asyncio.run(subroutine)
print(test)