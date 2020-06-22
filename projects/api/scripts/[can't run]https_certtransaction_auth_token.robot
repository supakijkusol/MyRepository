*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem     # About File

*** Variables ***
${base_url}=     https://certtransaction.elementexpress.com
${bearerToken}=     "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BearerAuthTest
    create session     mysession     ${base_url}

    ${headers}=     create dictionary     Authorization=${bearerToken}     Content-Type=text/xml
    ${req_body}=     Get File     C:/SeleniumPractice/xmldata/PostData.txt

    ${response}=     post request     mysession     /     data=${req_body}     headers=${headers}
    Log     ${response.status_code}
    Log     ${response.content}

