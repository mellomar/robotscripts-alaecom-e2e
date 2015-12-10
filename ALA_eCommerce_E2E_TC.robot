*** Settings ***
Library           Selenium2Library
Library           SSHLibrary
Library           Collections

*** Variables ***
${var_url}        https://ala-shop.prometstaging.com/
${btn_join_renew}    xpath=//ul[@id='secondary-menu']/li[1]/a
${btn_donate}     xpath=//ul[@id='secondary-menu']/li[2]/a
${inp_email}      edit-email
${var_email}      prometqa34@prometsource.com
${btn_next}       edit-submit
${alrt_valid_email}    Email is valid.
${box_personal}    xpath=//div[contains(text(),'Personal')]
${frmfld_drpbtn}    //button/span[contains(text(),'--')]
${slct_mr}        xpath=//div//span[contains(text(),'Mr')]
${var_email1}     prometqa3004@prometsource.com
@{MEM}            Personal    Organization
@{MEM_P}          Regualar    Student    Retired Member
@{MEM_O}          International Library    Non-Profit Org    Chapter Member    Library    State Library    Corporation

*** Test Cases ***
Join as Personal Member - Regular
    SETUP BROWSER    ${var_url}    firefox
    Wait Until Element is Visible    xpath=//ul[@id='secondary-menu']/li[1]/a
    Click Element    xpath=//ul[@id='secondary-menu']/li[1]/a
    Wait Until Element is Visible    xpath=//input[@id='edit-email']    15
    Input Text    edit-email    ${var_email}
    Click Element    edit-submit
    Wait Until Page Contains    Email is valid.
    Click Element    xpath=//div[contains(text(),'Personal')]
    Click Button    xpath=//div[@class='section-body']/div[1]//button[@id='edit-submit']
    Wait Until Element is Visible    //button/span[contains(text(),'--')]
    Click Element    //button/span[contains(text(),'--')]
    Click Element    xpath=//div//span[contains(text(),'Mr')]
    Comment    CONTACT INFORMATION
    Sleep    1
    Select From List by Value    id=edit-prefix    Mr
    Wait Until Element is Visible    id=edit-first-name
    Input Text    edit-first-name    Promet
    Input Text    edit-middle-name    Source
    Input Text    edit-last-name    QA
    Input Text    edit-password-pass1    prometqa
    Input Text    edit-password-pass2    prometqa
    Click Button    edit-next
    Comment    ADDRESS INFORMATION
    Input Text    edit-mailing-thoroughfare    50 E. Huron St.
    Input Text    edit-mailing-locality    Chicago
    Click Element    xpath=//button/span[contains(text(),'- Select -')]
    Sleep    0.5
    Click Element    xpath=//div//span[contains(text(),'Illinois')]
    Input Text    edit-mailing-postal-code    60611
    Click Button    edit-next
    Comment    I'M INTERESTED IN THE FOLLOWING
    Wait Until Page Contains    I'm interested in the following
    Click Element    edit-library-type-27
    Click Element    edit-specialties-30
    Click Element    edit-specialties-30
    Click Element    edit-interests-6
    Click Element    edit-interests-9
    Click Element    edit-interests-12
    Click Button    edit-next
    Comment    DIVISIONS
    Wait Until Page Contains    Based on your interests we have the following recommendations:
    Sleep    1
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-1 form-group']
    Sleep    0.5
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-divisions-4 form-group']
    Sleep    0.5
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-divisions-11 form-group']
    Sleep    0.5
    Click Element    edit-next
    Comment    SECTIONS
    Wait Until Page Contains    Would you like to join any of the following FREE Sections?
    Click Element    edit-divisions-1-sections-16
    Click Element    edit-next
    Comment    ROUND TABLES
    Wait Until Page Contains    Based on your interests we have the following recommendations:
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-96 form-group']
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-round-tables-85 form-group']
    Sleep    1
    Click Element    edit-return
    Comment    Membership Summary
    Wait Until Page Contains    Here is your Membership Summary:
    Click Element    xpath=//div/label[contains(text(),'10')]
    Wait Until Page Contains    A donation has already been added to your order.
    Input Text    edit-commerce-payment-payment-details-credit-card-owner    Test Test
    Input Text    edit-commerce-payment-payment-details-credit-card-number    4111111111111111
    Click Element    xpath=//div/button/span[contains(text(),'15')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'18')]
    Input Text    edit-commerce-payment-payment-details-credit-card-code    123
    Click Element    edit-continue
    Comment    CHECKOUT SURVEY
    CHECKOUT SURVEY
    [Teardown]    Close Browser

Join as Personal Member - Student
    SETUP BROWSER    ${var_url}    firefox
    Wait Until Element is Visible    xpath=//ul[@id='secondary-menu']/li[1]/a
    Click Element    xpath=//ul[@id='secondary-menu']/li[1]/a
    Wait Until Element is Visible    xpath=//input[@id='edit-email']    15
    Input Text    edit-email    ${var_email1}
    Click Element    edit-submit
    Wait Until Page Contains    Email is valid.
    Click Element    xpath=//div[contains(text(),'Personal')]
    Click Button    edit-submit--2
    Comment    Click Button    edit-submit
    Wait Until Element is Visible    //button/span[contains(text(),'--')]
    Click Element    //button/span[contains(text(),'--')]
    Click Element    xpath=//div//span[contains(text(),'Mr')]
    Comment    CONTACT INFORMATION
    Sleep    1
    Select From List by Value    id=edit-prefix    Mr
    Wait Until Element is Visible    id=edit-first-name
    Input Text    edit-first-name    Promet
    Input Text    edit-middle-name    Source
    Input Text    edit-last-name    QA
    Input Text    edit-password-pass1    prometqa
    Input Text    edit-password-pass2    prometqa
    Click Button    edit-next
    Comment    ADDRESS INFORMATION
    Input Text    edit-mailing-thoroughfare    50 E. Huron St.
    Input Text    edit-mailing-locality    Chicago
    Click Element    xpath=//button/span[contains(text(),'- Select -')]
    Sleep    0.5
    Click Element    xpath=//div//span[contains(text(),'Illinois')]
    Input Text    edit-mailing-postal-code    60611
    Click Button    edit-next
    Comment    I'M INTERESTED IN THE FOLLOWING
    Wait Until Page Contains    I'm interested in the following
    Click Element    edit-library-type-26
    Click Element    edit-specialties-39
    Click Element    edit-specialties-31
    Click Element    edit-interests-8
    Click Element    edit-interests-15
    Click Element    edit-interests-17
    Click Button    edit-next
    Comment    DIVISIONS
    Wait Until Page Contains    Based on your interests we have the following recommendations:
    Sleep    1
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-8 form-group']
    Sleep    0.5
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-9 form-group']
    Sleep    0.5
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-11 form-group']
    Sleep    0.5
    Click Element    edit-next
    Comment    SECTIONS
    Wait Until Page Contains    Would you like to join any of the following FREE Sections?
    Click Element    edit-divisions-9-sections-76
    Click Element    edit-divisions-9-sections-79
    Click Element    edit-divisions-9-sections-80
    Click Element    edit-next
    Comment    ROUND TABLES
    Wait Until Page Contains    Based on your interests we have the following recommendations:
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-96 form-group']
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-87 form-group']
    Click Element    xpath=//div[@class='form-item form-type-checkbox form-item-recommendations-98 form-group']
    Sleep    1
    Click Element    edit-return
    Comment    Membership Summary
    Wait Until Page Contains    Here is your Membership Summary:
    Click Element    xpath=//div/label[contains(text(),'10')]
    Wait Until Page Contains    A donation has already been added to your order.
    Input Text    edit-commerce-payment-payment-details-credit-card-owner    Test Test
    Input Text    edit-commerce-payment-payment-details-credit-card-number    4111111111111111
    Click Element    xpath=//div/button/span[contains(text(),'15')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'18')]
    Input Text    edit-commerce-payment-payment-details-credit-card-code    123
    Click Element    edit-continue
    Comment    CHECKOUT SURVEY
    CHECKOUT SURVEY
    [Teardown]    Close Browser

Regular Member Renew
    [Setup]
    SETUP BROWSER    https://ala-shop.prometstaging.com/membership/renew    firefox
    Wait Until Page Contains    Renew ALA    15
    Wait Until Page Contains Element    shib_login_url
    Click Element    shib_login_url
    Wait Until Page Contains    Test IDP Login to the ALA Website    15
    Wait Until Page Contains Element    username
    Input Text    username    1061117
    Input Password    password    ectest
    Submit Form
    Wait Until Page Contains    Renew your ALA membership:    15
    Wait Until Page Contains Element    xpath=//div[@class='membership-renew-link']
    Click Element    xpath=//div[@class='membership-renew-link']/a[contains(text(),'Renew')]
    Wait Until Page Contains    Here is your Membership Summary:
    Wait Until Page Contains Element    edit-next
    Click Button    edit-next
    Wait Until Page Contains    Your Contact Information
    Wait Until Page Contains Element    edit-next
    Click Button    edit-next
    Wait Until Page Contains    Here is your Membership Summary:
    Input Text    edit-commerce-payment-payment-details-credit-card-owner    Test Test
    Input Text    edit-commerce-payment-payment-details-credit-card-number    4111111111111111
    Click Element    xpath=//div/button/span[contains(text(),'15')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'18')]
    Input Text    edit-commerce-payment-payment-details-credit-card-code    123
    Click Element    edit-continue
    Wait Until Page Contains    Your order number is
    [Teardown]    Close Browser

Student Member Renew
    SETUP BROWSER    https://ala-shop.prometstaging.com/membership/renew    firefox
    Wait Until Page Contains    Renew ALA    15
    Wait Until Page Contains Element    shib_login_url
    Click Element    shib_login_url
    Wait Until Page Contains    Test IDP Login to the ALA Website    15
    Wait Until Page Contains Element    username
    Input Text    username    2058387
    Input Password    password    ectest
    Submit Form
    Wait Until Page Contains    Renew your ALA membership:    15
    Wait Until Page Contains Element    xpath=//div[@class='membership-renew-link']
    Click Element    xpath=//div[@class='membership-renew-link']/a[contains(text(),'Renew')]
    Wait Until Page Contains    Here is your Membership Summary:
    Wait Until Page Contains Element    edit-next
    Click Button    edit-next
    Wait Until Page Contains    Your Contact Information
    Wait Until Page Contains Element    edit-next
    Click Button    edit-next
    Wait Until Page Contains    Here is your Membership Summary:
    Input Text    edit-commerce-payment-payment-details-credit-card-owner    Test Test
    Input Text    edit-commerce-payment-payment-details-credit-card-number    4111111111111111
    Click Element    xpath=//div/button/span[contains(text(),'15')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'18')]
    Input Text    edit-commerce-payment-payment-details-credit-card-code    123
    Click Element    edit-continue
    Wait Until Page Contains    Your order number is
    [Teardown]    Close Browser

Donate as logged in user
    SETUP BROWSER    https://ala-shop.prometstaging.com/user    firefox
    Wait Until Page Contains    Shibboleth Login    15
    Wait Until Page Contains Element    edit-name
    Click Element    xpath=//div[@id='shib_login_url']/a
    Wait Until Page Contains    Test IDP Login to the ALA Website    15
    Wait Until Page Contains Element    username
    Input Text    username    1061117
    Input Password    password    ectest
    Submit Form
    Wait Until Page Contains Element    xpath=//a[contains(text(),'Donate')]    15
    Click Element    xpath=//a[contains(text(),'Donate')]
    Wait Until Page Contains Element    xpath=//a[@class='ala-donation-beginning-link ala-donation-beginning-donate-link']
    Click Element    xpath=//a[@class='ala-donation-beginning-link ala-donation-beginning-donate-link']
    Wait Until Page Contains    Please confirm your contact details:
    Wait Until Page Contains Element    xpath=//button[@id='edit-donate']
    Click Button    xpath=//button[@id='edit-donate']
    Wait Until Page Contains    Step: Projects
    Click Element    xpath=//a[contains(text(),'ALA')]
    Wait Until Page Contains Element    xpath=//input[@id='edit-project-104-amount']
    Input Text    xpath=//input[@id='edit-project-104-amount']    25
    Click Element    xpath=//input[@id='edit-project-102-amount']
    Sleep    2
    Input Text    xpath=//input[@id='edit-project-102-amount']    25
    Click Element    xpath=//input[@id='edit-project-104-amount']
    Sleep    2
    Click Element    xpath=//a[contains(text(),'DIVISIONS')]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'LLAMA')]
    Click Element    xpath=//a[contains(text(),'LLAMA')]
    Wait Until Element Is Visible    xpath=//input[@id='edit-project-123-amount']
    Input Text    xpath=//input[@id='edit-project-123-amount']    25
    Click Element    xpath=//a[contains(text(),'LLAMA')]
    Sleep    2.5
    Click Button    edit-return
    Wait Until Page Contains    your cart
    Input Text    edit-commerce-payment-payment-details-credit-card-owner    Test Test
    Input Text    edit-commerce-payment-payment-details-credit-card-number    4111111111111111
    Click Element    xpath=//div/button/span[contains(text(),'15')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'18')]
    Input Text    edit-commerce-payment-payment-details-credit-card-code    123
    Click Element    edit-continue
    [Teardown]    Close Browser

Test
    JOIN AS    mellomar.otarra@gmail.com    Personal    Regular

*** Keywords ***
CHECKOUT SURVEY
    Click Element    edit-field-survey-ethnicity-und-none
    Click Element    edit-field-survey-origin-und-asian
    Click Element    edit-field-survey-disability-und-none
    Click Element    edit-field-survey-degrees-und-bachelors
    Input Text    edit-field-survey-comments-und-0-value    N/A
    Click Button    edit-actions-submit

SETUP BROWSER
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

CLOSE THIS BROWSER
    Close Browser

JOIN AS
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    [Documentation]    Name: JOIN AS
    ...
    ...    Source: Native
    ...
    ...    Argument: [ | e-mail | membership type | sub membership type ]
    ...
    ...    To use this keyword, you should be in the ala-shop homepage (https://ala-shop.prometstaging.com).
    ...
    ...    It will navigate and use the e-mail provided above to join depending on the membership type and sub membership type provided as an argument.
    ...
    ...    Membership Type:
    ...    + Personal
    ...    - Regular
    ...    - Student
    ...    - Retired Member (Not yet supported)
    ...    - More Options (Not yet supported)
    ...
    ...    + Organization
    ...    - International Library
    ...    - Non-Profit Org
    ...    - Chapter Member
    ...    - Library
    ...    - State Library
    ...    - Corporation
    ${email} =    set variable    ${arg1}
    ${memtype} =    Create List    Personal    Organization
    ${flag} =     List Should Not Contain Value    ${memtype}    ${arg2}    msg=Failed
    ${m} =    Run Keyword If    '${flag}' == 'Failed'    Set Variable    ${arg2}
    Log    ${m}

GET_MEM
    [Arguments]    ${arg1}
