require "selenium-webdriver"
 
#Firefox browser instantiation
driver = Selenium::WebDriver.for :firefox

 
#Loading the gmail URL
driver.navigate.to "https://www.redfin.com/"

#Login to RedFin
signInLable = driver.find_element(:link, 'Sign In')
signInLable.click()
 
#User name input field identification and data entered
usernametext = driver.find_element(:name, 'emailInput')
usernametext.send_keys "mikedmzhang@gmail.com" #put your actual username
 
#Password input field identification and data entered
passwordtext = driver.find_element(:name, 'passwordInput')
passwordtext.send_keys "IPE3V7ChUr" #put your actual password
 
#Log in button identification and click it
loginbutton = driver.find_element(:css, "Button.primary.submitButton.v3")
loginbutton.click
 
#Search address
addressInputBox = driver.find_element(:name, 'searchInputBox')
addressInputBox.send_keys "2667 Dietrich Dr, Tustin CA 92782"

searchBtn = driver.find_element(:css, ".inline-block.SearchButton.clickable.float-right")
searchBtn.click()

#Switch to new pop up window
first_window = driver.window_handle
all_windows = driver.window_handles
new_window = all_windows.select { |this_window| this_window != first_window }
driver.switch_to.window(new_window)

address = driver.find_element(:css,".item-title.block")
address.click()

#Result verify
streetAddress = driver.find_element(:class,"street-address")
puts streetAddress.getAttribute("title")

#Quitting the browser
driver.close
driver.quit