*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=dados.xlsx    sheet_name=Plan1
Test Template    Buscar e Enviar WhatsApp

*** Variables ***
${URL}    https://exemplo.com
${WHATSAPP_WEB}    https://web.whatsapp.com
${SCREENSHOT}    screenshot.png

*** Test Cases ***
Caso de Teste ${Pesquisa} ${Contato WhatsApp}

*** Keywords ***
Buscar e Enviar WhatsApp
    [Arguments]    ${Pesquisa}    ${Contato WhatsApp}
    
    # Abrir site e buscar termo
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Input Text    xpath=//input[@name="q"]    ${Pesquisa}
    Press Keys    xpath=//input[@name="q"]    ENTER
    Sleep    3s
    Capture Page Screenshot    ${SCREENSHOT}
    Close Browser
    
    # Abrir WhatsApp Web e enviar imagem
    Open Browser    ${WHATSAPP_WEB}    Chrome
    Sleep    5s
    Click Element    xpath=//span[contains(text(), '${Contato WhatsApp}')]
    Sleep    2s
    Press Keys    None    Ctrl+N
    Sleep    2s
    Press Keys    None    ${SCREENSHOT}
    Press Keys    None    ENTER
    Sleep    2s
    Close Browser
