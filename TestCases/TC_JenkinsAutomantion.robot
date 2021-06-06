*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/UserDefinedKeyword.robot
Variables  ../TestData/LoginData.py

Suite Setup  Start Test Suite
Suite Teardown  End Test Suite

*** Variables ***
${url}  https://admin-demo.nopcommerce.com/login
${browsername}  chrome

*** Test Cases ***
TC_001 Login Operation
  Open the webisite  ${url}  ${browsername}
  Given Enter Username  ${username}
  Given Enter Password  ${password}
  Then Click on Login Button
  Then Wait for some time
  Then Verify Login Successfully

TC_002 Logout Operation
  Then Wait for some time
  Then Logout from Website
  Then Wait for some time
  Then Verify Logout Successfully

