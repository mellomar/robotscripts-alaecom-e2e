*** Settings ***
Library           Selenium2Library
Library           SSHLibrary
Library           Collections

*** Variables ***
${var_url}        https://ala-shop.prometstaging.com/
${var_email}      prometqa360@prometsource.com
${var_email1}     prometqa30051@prometsource.com

*** Test Cases ***
TEST
    \    https://ala-shop.prometstaging.com/membership/renew    firefox    1144377    ectest

Join as Personal Member - Regular
    Go To Join and Enter New Email    ${var_url}    firefox    mellomar117@prometsource.com
    Select Membership Type    Personal    Regular Member
    Fill Contact Information And Submit    Mellomar    Otarra    1z2x3c*()
    Fill Address Information And Submit    50 E. Huron St.    Chicago    Illinois    60611
    Select Interest and Submit    Public Libraries    Young Adult Services    Adult Services
    Select Divisions and Submit    American Association of School Librarians    Library and Information Technology Association
    Select Sections and Submit    Educators of School Librarians    Student Special Interest Group
    Select Round Table And Submit    New Member Round Table    Exhibits Round Table    Ethnic and Multicultural Information Exchange Round Table    Library Research Round Table    Library History Round Table
    Checkout And Submit    10    Test Test    4111111111111111    12    18    123
    Take Survey and Submit

Join as Personal Member - Student
    Go To Join and Enter New Email    ${var_url}    firefox    mellomar216@prometsource.com
    Select Membership Type    Personal    Student Member
    Fill Contact Information And Submit    Mellomar    Otarra    1z2x3c*()
    Fill Address Information And Submit    50 E. Huron St.    Chicago    Illinois    60611
    Select Interest and Submit    Public Libraries    Young Adult Services    Adult Services
    Select Divisions and Submit    American Association of School Librarians    Library and Information Technology Association
    Select Sections and Submit    Educators of School Librarians    Student Special Interest Group
    Select Round Table And Submit    New Member Round Table    Exhibits Round Table    Ethnic and Multicultural Information Exchange Round Table    Library Research Round Table    Library History Round Table
    Checkout And Submit    10    Test Test    4111111111111111    12    18    123
    Take Survey and Submit

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

*** Keywords ***
CLOSE THIS BROWSER
    Close Browser

Go To Join and Enter New Email
    [Arguments]    ${url}    ${browser}    ${email}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element is Visible    xpath=//ul[@id='secondary-menu']/li[1]/a
    Click Element    xpath=//ul[@id='secondary-menu']/li[1]/a
    Wait Until Element is Visible    xpath=//input[@id='edit-email']
    Input Text    xpath=//input[@id='edit-email']    ${email}
    Click Button    edit-submit
    Wait Until Page Contains    Join ALA
    Wait Until Page Contains    Select a Membership Type
    Wait Until Page Contains    Personal
    Wait Until Page Contains    Organizational or Corporate

Select Membership Type
    [Arguments]    ${mem_type}    ${sub_mem}
    Click Element    //div[contains(text(),'${mem_type}')]
    Wait Until Element Is Visible    xpath=//div[contains(text(),'${sub_mem}')]
    Click Element    xpath=//div[contains(text(),'${sub_mem}')]
    Wait Until Page Contains    Personal Membership
    Wait Until Page Contains    Step 1: Contact Info
    Wait Until Page Contains    Your Contact Information

Fill Contact Information And Submit
    [Arguments]    ${firstname}    ${lastname}    ${password}
    Comment    Wait Until Element Is Visible    xpath=//select[@id='edit-prefix']
    Wait Until Element is Visible    //button/span[contains(text(),'--')]
    Click Element    //button/span[contains(text(),'--')]
    Click Element    xpath=//div//span[contains(text(),'Mr')]
    Input Text    edit-first-name    ${firstname}
    Input Text    edit-last-name    ${lastname}
    Input Text    edit-password-pass1    ${password}
    Input Text    edit-password-pass2    ${password}
    Click Button    edit-next
    Wait Until Page Contains    Step 2: Address
    Wait Until Page Contains    Address Information

Fill Address Information And Submit
    [Arguments]    ${add1}    ${city}    ${state}    ${zip}
    Input Text    edit-mailing-thoroughfare    ${add1}
    Input Text    edit-mailing-locality    ${city}
    Click Element    xpath=//button/span[contains(text(),'- Select -')]
    Sleep    0.5
    Click Element    xpath=//div//span[contains(text(),'${state}')]
    Input Text    edit-mailing-postal-code    ${zip}
    Click Button    edit-next
    Wait Until Page Contains    Step 3: Interests
    Wait Until Page Contains    If you tell us a little about yourself, we can recommend your best networking opportunities.
    Wait Until Page Contains    I'm interested in the following

Select Interest and Submit
    [Arguments]    @{interests}
    : FOR    ${interest}    IN    @{interests}
    \    Click Element    xpath=//div[@class='membership-interests-block']//label[contains(text(),'${interest}')]
    Click Button    edit-next
    Wait Until Page Contains    Step 4: Divisions
    Wait Until Page Contains    DIVISIONS

Select Divisions and Submit
    [Arguments]    @{divisions}
    : FOR    ${division}    IN    @{divisions}
    \    Click Element    xpath=//div[@class='product-box clickable-box clickable-box-render-processed']//h2[contains(text(),'${division}')]
    Click Button    edit-next

Select Sections and Submit
    [Arguments]    @{sections}
    : FOR    ${section}    IN    @{sections}
    \    Click Element    xpath=//span[contains(text(),'${section}')]
    Click Button    edit-next
    Wait Until Page Contains    Step 6: Round Tables
    Wait Until Page Contains    ROUND TABLES
    Wait Until Page Contains    Based on your interests we have the following recommendations:

Select Round Table And Submit
    [Arguments]    @{round_tables}
    : FOR    ${round_table}    IN    @{round_tables}
    \    Click Element    xpath=//h2[contains(text(),'${round_table}')]
    Click Button    edit-return
    Wait Until Page Contains    Step 7: Checkout
    Wait Until Page Contains    Here is your Membership Summary:
    Wait Until Page Contains    Would you like to help support libraries and give a gift to ALA today?

Checkout and Submit
    [Arguments]    ${donation}    ${cc_name}    ${cc_num}    ${exp_mo}    ${exp_yr}    ${sec_code}
    Click Element    xpath=//div/label[contains(text(),'${donation}')]
    Wait Until Page Contains    A donation has already been added to your order.
    Input Text    edit-commerce-payment-payment-details-credit-card-owner    ${cc_name}
    Input Text    edit-commerce-payment-payment-details-credit-card-number    ${cc_num}
    Click Element    xpath=//button/span[contains(text(),'12')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'${exp_mo}')]
    Click Element    xpath=//button/span[contains(text(),'15')]
    Click Element    xpath=//div[@class='dropdown-menu open']//span[contains(text(),'${exp_yr}')]
    Input Text    edit-commerce-payment-payment-details-credit-card-code    ${sec_code}
    Click Element    edit-continue
    Wait Until Page Contains    Step 7: Checkout
    Wait Until Page Contains    Your order number is
    Wait Until Page Contains    on your account page when logged in.
    Wait Until Element Is Visible    //div[@id='edit-ala-commerce-survey']/a[contains(text(),'Continue to membership survey')]

Take Survey and Submit
    Click Element    //div[@id='edit-ala-commerce-survey']/a[contains(text(),'Continue to membership survey')]
    Wait Until Page Contains    Thank you, ALA Member, for agreeing to participate in this survey.
    Click Element    edit-field-survey-ethnicity-und-none
    Click Element    edit-field-survey-origin-und-asian
    Click Element    edit-field-survey-disability-und-none
    Click Element    edit-field-survey-degrees-und-bachelors
    Input Text    edit-field-survey-comments-und-0-value    N/A
    Click Button    edit-submit
    Wait Until Page Contains    Your submission has been saved.

Go To Renew And Login
    [Arguments]    ${url}    ${browser}    ${login}    ${password}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Renew ALA
    Wait Until Page Contains Element    shib_login_url
    Click Element    shib_login_url
    Wait Until Page Contains    Test IDP Login to the ALA Website
    Input Text    username    ${login}
    Input Password    password    ${password}
    Submit Form
    Wait Until Page Contains    Renew your ALA membership:
    Wait Until Page Contains Element    xpath=//div[@class='membership-renew-link']
