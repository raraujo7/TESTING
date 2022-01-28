*** Settings ***
Documentation         Deafio 5 retorno 5 ou 10

Library    String

*** Variables ***
@{NUMBERS}    1    2    3    4    5    6    7    8    9    10    11    12


*** Test Cases ***
Caso de Test 01
    [Documentation]    Faz um loop com if
    Teste de numero 

*** Keywords ***
Teste de numero 
    Log To Console    ${\n}
    FOR    ${i}  IN  @{NUMBERS}
        IF    ${i} == 5 or ${i} == 10
            Log     Eu sou o numero: ${i}!
        ELSE
            Log     "Eu não sou o numero 5 nem o 10!"
            
        END
    END
