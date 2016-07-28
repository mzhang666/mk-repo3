require 'capybara'
require 'capybara/dsl'
require 'logger'

include Capybara::DSL

Capybara.default_max_wait_time = 2

session = Capybara::Session.new(:selenium)
session.visit "https://www.redfin.com/"

logger = Logger.new(STDOUT)

#Sign In
session.find('a', :text => 'Sign In').click()
session.fill_in('emailInput', :with => 'mikedmzhang@gmail.com')
session.fill_in('passwordInput', :with => 'IPE3V7ChUr')
session.find('button', :text => 'Sign In').click()

logger.info("Sign in pass")

#Search Address
session.fill_in('searchInputBox', :with => '2667 Dietrich Dr, Tustin CA 92782',:match => :prefer_exact)
session.find(:css, ".inline-block.SearchButton.clickable.float-right",:match => :prefer_exact).click()

logger.info("Search pass")

#Result
session.find(:css, ".item-title.block",:match => :prefer_exact).click()

logger.info("Result pass")

