*** Settings ***
Library  SeleniumLibrary
Documentation    Suite Description

*** Variables ***
${LOGIN URL}  https://scouts-test.futbolkolektyw.pl/en
${BROWSER}  Chrome

*** Test Cases ***
Login to the system
   Open login page


*** Keywords ***
Open login page
   Open Browser  ${LOGIN URL}  ${BROWSER}


