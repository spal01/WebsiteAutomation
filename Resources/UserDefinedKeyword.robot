*** Settings ***
Library  SeleniumLibrary
Library  String

Variables  ../PageObjectRepository/LoginPageLocator.py
Variables  ../PageObjectRepository/HomePageLocator.py

*** Keywords ***
Open the webisite
  [Arguments]  ${url}  ${browsername}
  Open Browser  ${url}  ${browsername}
  Maximize Browser Window

Given Enter Username
  [Arguments]  ${user_name}
  Clear Element Text  ${username_locator}
  Input Text  ${username_locator}  ${user_name}

Given Enter Password
  [Arguments]  ${pwd}
  Clear Element Text  ${password_locator}
  Input Text  ${password_locator}  ${pwd}

Then Click on Login Button
  Click Button  ${loginbutton_locator}

Then Wait for some time
  Sleep  2

Then Verify Login Successfully
  ${page_title}=  Get Title
  Should Be Equal  ${page_title}  Dashboard / nopCommerce administration

Then Logout from Website
  Click Link  ${logout_locator}

Then Verify Logout Successfully
  Page Should Contain Element  ${username_locator}

Then Close the Browser
  Close Browser


Start Test Suite
  log to console  Test Execution Started

End Test Suite
  log to console  All Test Execution Completed
  Then Close the Browser


