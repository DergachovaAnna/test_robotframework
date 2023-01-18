*** Settings ***
Library  SeleniumLibrary
Documentation    Suite Description

*** Variables ***
${LOGIN URL}  https://scouts-test.futbolkolektyw.pl/en
${BROWSER}  Chrome
${SIGNINBUTTON}   xpath=//*[text()="Sign in" or text()="Zaloguj"]
${EMAILINPUT}    xpath=//*[@id="login"]
${PASSWORDINPUT}   xpath=//*[@id="password"]
${PAGELOGO}    xpath=//*[@title="Logo Scouts Panel"]
${SIGNOUTBUTTON}  xpath=//*[text()="Sign out" or text()="Wyloguj"]//ancestor::*[@role="button"]


*** Test Cases ***
Login to the system
   Open login page
   Type in email
   Type in password
   Click on the submit button
   Assert dashboard


Log out of the system
   Click on the log out button
   Assert login page
   [Teardown]  Close Browser

*** Keywords ***
Open login page
   Open Browser  ${LOGIN URL}  ${BROWSER}
   Title should be    Scouts panel - sign in
Type in email
   Input Text    ${EMAILINPUT}   user07@getnada.com
Type in password
   Input Password    ${PASSWORDINPUT}   Test-1234
Click on the submit button
   Click Element    ${SIGNINBUTTON}
Assert dashboard
   Wait Until Element Is Visible    ${PAGELOGO}
   Title Should Be    Scouts panel
   Capture Page Screenshot    alert.png
[Teardown]  Close Browser

Click on the log out button
   Click Element    ${SIGNOUTBUTTON}
Assert login page
   Title Should Be    Scouts panel - sign in




