*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.flipkart.com

*** Test Cases ***
Open Flipkart and Add to Cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//*[text()='✕']
    Sleep    2

    # Go to 'Electronics' tab
    Click Link    xpath=//*[text()='Electronics']

    # Search for any desired mobile in 'Mobiles' section
    Input Text    css=input[type="text"][title="Search for products, brands and more"]    Iphone12
    Press Keys    css=input[type="text"][title="Search for products, brands and more"]    \\13
    Sleep    2

    # Scroll and select the mobile from the list
    Scroll To Element    xpath=//div[contains(@class, 'bhgxx2')][6]    vertical=center
    Sleep    1
    Scroll To Element    xpath=//div[contains(@class, 'bhgxx2')][11]    vertical=center
    Sleep    1
    Scroll To Element    xpath=//div[contains(@class, 'bhgxx2')][16]    vertical=center
    Sleep    1
    Scroll To Element    xpath=//div[contains(@class, 'bhgxx2')][21]    vertical=center
    Sleep    1
    Scroll To Element    xpath=//div[contains(@class, 'bhgxx2')][26]    vertical=center
    Sleep    1

    # Click on the desired mobile's details page
    Click Element    xpath=//div[contains(@class, 'bhgxx2')][6]//a
    Sleep    2

    # Click on ADD TO CART button
    Click Button    xpath=//b
    
        utton[contains(., 'ADD TO CART')]
    Sleep    2

    Close Browser

*** Keywords ***
Scroll To Element
    [Arguments]    ${locator}    ${scrollType}
    Execute JavaScript    window.scrollTo(0, document.querySelector('${locator}').getBoundingClientRect().${scrollType});