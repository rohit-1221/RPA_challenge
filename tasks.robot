*** Settings ***
Documentation   Template robot main suite.
Library         RPA.Excel.Files
Library         RPA.Tables
Library         RPA.Browser.Selenium    auto_close=${False}

*** Tasks ***
Rpa challenge task
     Open Workbook     C:/Users/rohit.talekar/Downloads/challenge.xlsx
     @{data} =   Read Worksheet as Table   header=True
     Close Workbook
     
   Open Available Browser       https://www.rpachallenge.com/
    Click Button    Start
    FOR     ${row}  IN  @{data}
    Input Text     xpath://input[@ng-reflect-name="labelFirstName"]          ${row}[First Name]
    Input Text     css:input[ng-reflect-name="labelLastName"]           ${row}[Last Name]
    Input Text     css:input[ng-reflect-name="labelPhone"]              ${row}[Phone Number]
    Input Text     css:input[ng-reflect-name="labelEmail"]              ${row}[Email]
    Input Text     css:input[ng-reflect-name="labelAddress"]            ${row}[Address]
    Input Text     css:input[ng-reflect-name="labelCompanyName"]        ${row}[Company Name]
    Input Text     css:input[ng-reflect-name="labelRole"]               ${row}[Role in Company]
    
    Click Button   css:input[value="Submit"]   
    END
    
