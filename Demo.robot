*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    Dialogs
Library    BuiltIn
Library    XML

Suite Setup     Open Browser To Google
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.aquariux.com/solutions/trader/
${BROWSER}    Chrome
${USERNAME}    2091003623
${PASSWORD}    !q1!T7J!ahU!
${STARTDEMO_BTN}    xpath=//div[@class='product-wrapper']//button[@class='Buttonstyled__Button-sc-1s3irv9-0 hzdZtg']
${LOGIN_BTN}    xpath=//p[@class='ExperienceForm__StyledLoginWrapper-sc-ynl0ku-2 gJGUVv']//button
${DEMOPACOUNT_BTN}    xpath=//div[@class='sc-1jd986s-0 iqiCBC']
${_TXT}    Set Variable    xpath=//form//div[@class='sc-fpc7vq-5 ldgdax'][${VALUE}]//input[@class='sc-13osccp-0 cjlePd large']
${VALUE}    1
${Order_Type_BTN}    xpath=//div[@class='sc-ik65sj-0 ioNMCN']
${Size_input}    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0')][1]//input
${Stop_loss_input}    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][2]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][2]//input
${XPATH_LIST}      xpath=//div[@class='sc-1cyjrzn-1 dIPaVz']//div[contains(@class,'sc-1alk9gx-0 bvuPRn')]
${TARGET_CLASS}    sc-1alk9gx-0 bvuPRn trading
${Place_buy_order_btn}    xpath=//button[@class='sc-88z1lo-0 cElBaW large stretch']
${Confirm_btn}    xpath=//button[@class='sc-88z1lo-0 cElBaW xlarge stretch']
${Sell_btn}    xpath=//div[@data-testid='trade-button-order-sell']
${notification}    xpath=//div[@class='sc-1q2cym3-7 kjJlKR']
${EXPECTED_TEXT}    Invalid Stop loss or Take profit
${Buy_btn}    xpath=//div[@data-testid='trade-button-order-buy']
${Track_OP_btn}    xpath=//tbody[@data-testid='asset-open-list']//tr[1]//th[2]//div[@class='sc-1wqjzz1-0 zZvHT']//div[1]
${Close_OP_btn}    xpath=//tbody[@data-testid='asset-open-list']//tr[1]//th[2]//div[@class='sc-1wqjzz1-0 zZvHT']//div[2]
${Edit_OP_btn}    xpath=//tbody[@data-testid='asset-open-list']//tr[1]//th[2]//div[@class='sc-1wqjzz1-0 zZvHT']//div[3]
${cancel_btn}    xpath=//div[@class='sc-1yeupjz-1 sc-1b7ygoy-1 cBPaQb dsYCQM']//button[1]
${confirm_OP_btn}    xpath=//div[@class='sc-1yeupjz-1 sc-1b7ygoy-1 cBPaQb dsYCQM']//button[2]
${Update_Buy_Order_btn}    xpath=//button[@data-testid='edit-button-order']
${Update_Buy_Order_Stop_Loss_input}    xpath=//div[@class='sc-19glk9s-1 jdbEVN']//div[contains(@class,'sc-chqthq-0')][1]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][1]//input
${noti_btn}    xpath=//div[@data-testid='notification-selector']
${noti_result}    xpath=//div[@data-testid='notification-list-result']//div[contains(@class,'read clickable')][1]//div[@class='sc-pq1npr-3 gkyHnT']


*** Keywords ***
Open Browser To Google
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Given I open browser to Google ${query}
    Open Browser To Google
    Sleep    ${query}    Waiting for page to fully load
When I click "${query}" in page
    Input Text    name=q    ${query}
    Press Keys    name=q    ENTER

Then I should see search results related to "${query}"
    Title Should Be    ${query}

I log in to my account
    [Arguments]    ${username}    ${password}
    ${VALUE}    Set Variable    1
    ${LOGIN_TXT}    Set Variable    xpath=//form//div[@class='sc-fpc7vq-5 ldgdax'][${VALUE}]//input[@class='sc-13osccp-0 cjlePd large']
    Input Text    ${LOGIN_TXT}     ${username}
    ${VALUE}    Set Variable    2
    ${LOGIN_TXT}    Set Variable    xpath=//form//div[@class='sc-fpc7vq-5 ldgdax'][${VALUE}]//input[@class='sc-13osccp-0 cjlePd large']
    Input Text    ${LOGIN_TXT}     ${password}
    Click Button    xpath=//button[@type='submit']

I click on ${query}
    Click Element    ${query}

I click to select ${query}
    Click Element    ${query}

I input to ${_TXT} ${query}
    Input Text    ${_TXT}     ${query}

I clear to ${query}
    Click Element    ${query}
    Sleep    500ms
    Press Keys    ${query}    CONTROL+A
    Press Keys    ${query}    BACKSPACE

I get text ${_TXT}
    ${text}=    Get Text    ${_TXT}
    
I Login with Demo Account
    I click on ${STARTDEMO_BTN}
    Sleep    1s    Waiting for page to fully load
    I click on ${LOGIN_BTN}
    Sleep    2s    Waiting for page to fully load
    I click on ${DEMOPACOUNT_BTN}
    I log in to my account    ${USERNAME}    ${PASSWORD}
    Sleep    2s    Waiting for page to fully load

I compare class values
        ${elements}    Get WebElements    ${XPATH_LIST}
    FOR    ${element}    IN    @{elements}
        ${class}    Get Element Attribute    ${element}    class
        Log    Checking Class: ${class}
        Run Keyword If    "${class}" == "${TARGET_CLASS}"    Click Element    ${element}
    END
    Sleep    3s

I Check Stop Loss Input ${query}
    ${VALUE1}    Set Variable    2
    ${VALUE2}    Set Variable    1
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    I input to ${Stop_loss_input} ${query}
    Sleep    1s

I Set Stop Loss Input ${query}
    ${VALUE1}    Set Variable    2
    ${VALUE2}    Set Variable    1
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    I input to ${Stop_loss_input} ${query}
    Sleep    1s
    I click on ${Place_buy_order_btn}
    Sleep    1s
    I click on ${Confirm_btn}
    Sleep    3s
I Set Take Profit Input ${query}
    ${VALUE1}    Set Variable    3
    ${VALUE2}    Set Variable    1
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    I input to ${Stop_loss_input} ${query}
    Sleep    1s
    I click on ${Place_buy_order_btn}
    Sleep    1s
    I click on ${Confirm_btn}
    Sleep    3s

I Set Take Profit and clear Stop Loss ${query}
    ${VALUE1}    Set Variable    2
    ${VALUE2}    Set Variable    1
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    I clear to ${Stop_loss_input} 
    Sleep    3s
    I clear to ${Stop_loss_input} 
    Sleep    1s
        ${VALUE1}    Set Variable    3
    ${VALUE2}    Set Variable    1
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    I input to ${Stop_loss_input} ${query}
    I click on ${Place_buy_order_btn}
    Sleep    1s
    I click on ${Confirm_btn}
    Sleep    3s
I click to trade
    I click on ${Place_buy_order_btn}
    Sleep    1s
    I click on ${Confirm_btn}
    Sleep    3s


*** Test Cases ***
Testcase1 Buy order without One-Click Trading function
    [Tags]    1.1.1
    Given I Login with Demo Account
        Wait Until Element Is Visible    ${Order_Type_BTN}
        I compare class values    #Check the coins that can be traded and click
    When I click on ${Order_Type_BTN}
        ${VALUE}    Set Variable    1
        ${Order_Type_Item}    Set Variable    xpath=//div[@class='sc-ik65sj-4 bNyLRJ visible']//div[${VALUE}]
    Then I click to select ${Order_Type_Item}
    And I input to ${Size_input} 20
        I Check Stop Loss Input 10
        I click on ${Buy_btn}
    ${VALUE1}    Set Variable    2
    ${VALUE2}    Set Variable    2
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    
    ${value}    Get Element Attribute    ${Stop_loss_input}    value
    Log    ${value}
    ${NUMBER}    Convert To Integer    ${value}
    Run Keyword If    ${NUMBER} > 0    I click to trade
    ...    ELSE    I Set Take Profit and clear Stop Loss 10
    


Testcase2 Sell order without One-Click Trading function
    [Tags]    1.1.2
    # Given I Login with Demo Account
    #     Wait Until Element Is Visible    ${Order_Type_BTN}
    #     I compare class values    #Check the coins that can be traded and click
    When I click on ${Order_Type_BTN}
        ${VALUE}    Set Variable    1
        ${Order_Type_Item}    Set Variable    xpath=//div[@class='sc-ik65sj-4 bNyLRJ visible']//div[${VALUE}]
    Then I click to select ${Order_Type_Item}
    And I click on ${Sell_btn}
    And I input to ${Size_input} 20
        ${VALUE1}    Set Variable    2
        ${VALUE2}    Set Variable    1
        ${Stop_loss_input}   Set Variable  xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input

        I input to ${Stop_loss_input} 10

        I click on ${Sell_btn}

        ${VALUE1}    Set Variable    2
        ${VALUE2}    Set Variable    2
        ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    
        ${value}    Get Element Attribute    ${Stop_loss_input}    value
        Log    ${value}
        ${NUMBER}    Convert To Integer    ${value}
        Run Keyword If    ${NUMBER} > 0    I click to trade
        ...    ELSE    I Set Take Profit and clear Stop Loss 10


Testcase3 Delete Stop Loss
    [Tags]    1.1.3
    ${VALUE1}    Set Variable    2
    ${VALUE2}    Set Variable    1
    ${Stop_loss_input}    Set Variable    xpath=//div[@class='sc-1rg515n-1 fHyqpH']//div[contains(@class,'sc-chqthq-0 ')][${VALUE1}]//div[@class='sc-1jag8dy-1 gSFlWi']//div[@class='sc-1jag8dy-2 cgjkUc'][${VALUE2}]//input
    I clear to ${Stop_loss_input} 
    Sleep    3s
    I clear to ${Stop_loss_input} 
    #Pause Execution
    Take Screenshot

Testcase4 Track the Open Position
    [Tags]    1.1.4
    When I click on ${Track_OP_btn}    #System show track in inframe

Testcase5 Close the Open Position successfully
    [Tags]    1.1.5
    When I click on ${Close_OP_btn}
    ${ACTUAL_TEXT1}    Get Text    xpath=//div[@class='sc-hvvxec-2 juKPEw']//div
    Then I click on ${confirm_OP_btn}
    Sleep    2s
    ${ACTUAL_TEXT2}    Get Text    xpath=//div[@class='sc-1q2cym3-5 hWtVB']
    And Take Screenshot

Testcase6 Close the Open Position unsuccessfully
    [Tags]    1.1.6
    Sleep    2s
    When I click on ${Close_OP_btn}
    ${ACTUAL_TEXT1}    Get Text    xpath=//div[@class='sc-hvvxec-2 juKPEw']//div
    Then I click on ${cancel_btn}
    Sleep    2s
    And Take Screenshot


Testcase7 Edit the Open Position successfully
    [Tags]    1.1.7
    When I click on ${Edit_OP_btn}
    Sleep    2s
    Then I input to ${Update_Buy_Order_Stop_Loss_input} 20
    Sleep    1s
    And I click on ${Update_Buy_Order_btn}
    Take Screenshot