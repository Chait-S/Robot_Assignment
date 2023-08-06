*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.flipkart.com
${MOBILE_NAME}    Iphone12

*** Test Cases ***
Open Flipkart, Add to Cart, and Verify in Cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//*[text()='✕']
    Sleep    2

    # Go to 'Electronics' tab
    Click Link    xpath=//*[text()='Electronics']

    # Search for the desired mobile in 'Mobiles' section
    Input Text    css=input[type="text"][title="Search for products, brands and more"]    ${MOBILE_NAME}
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
    Click Button    xpath=//button[contains(., 'ADD TO CART')]
    Sleep    2

    # Go to Cart
    Click Link    xpath=//a[contains(@href, '/cart')]
    Sleep    2

    # Verify if the added mobile is available in the list
    Element Should Contain    xpath=//div[@data-id][contains(@data-id,'${MOBILE_NAME}')]    ${MOBILE_NAME}

    Close Browser

*** Keywords ***
Scroll To Element
    [Arguments]    ${locator}    ${scrollType}
    Execute JavaScript    window.scrollTo(0, document.querySelector('${locator}').getBoundingClientRect().${scrollType});
