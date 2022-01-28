*** Settings ***
Documentation         Deafio 4 retorna email valido
Library           String


*** Variables ***
&{PERSON}        first_name=Abilio    last_name=Souza    domain=@testerobot.com


*** Test Cases ***
Caso de Test 01
    Cria um email valido

*** Keywords ***
Cria um email valido
    ${STR}          Generate Random String   8
    ${EMAIL}        Retorna um email valido    ${PERSON.first_name}     ${PERSON.last_name}    ${STR}    ${PERSON.domain}
    Log             ${EMAIL}


Retorna um email valido
    [Arguments]     ${NOME}    ${SOBRENOME}    ${TEXTO}    ${DOMINIO}
    ${FIM}          Catenate   SEPARATOR=    ${NOME}      ${SOBRENOME}    ${TEXTO}    ${DOMINIO}
    [Return]        ${FIM}
