*** Settings ***
Library    SeleniumLibrary
Library           String

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com
${DOMAIN}       gmail.com
${FIRST_NAME}   Abilio
${LAST_NAME}    SOUZA
${EMAIL_FINAL}  ${EMPTY}
${PASS}         12345Q
${ADDR}         rua 12345
${CITY}         sao paulo
${CODE}         00000
${PHONE}        5511999881234
${ADDR_ALIAS}   casa


*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser    about:blank   ${BROWSER}
    Maximize Browser Window  
    
#Fechar navegador
#    Close Browser

#### Ações
Acessar a página home do site
    Go To               ${URL}
    Title Should Be     My Store
    #Sleep  2s

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          name=search_query    ${PRODUTO}

Clicar na HomePage
    Click Element       xpath=//*[@id="header_logo"]//img

Clicar no botão "${TYPEBTN}"
    IF    "${TYPEBTN}" == "search"
        Click Element       name=submit_search
    ELSE IF  "${TYPEBTN}" == "create"
        Click Element       name=SubmitCreate
    END

Passar o mouse por cima da categoria "${CATEGORIA}"     
    Mouse Over          xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"] 

Clicar na subcategoria "${SUBCAT}"
    Click Element       xpath=//*[@id="block_top_menu"]//a[@title="${SUBCAT}"]

Clicar no botão "${BUTTON}" do produto   
    Click Element      xpath=//*[@id="center_column"]//a[@title="${BUTTON}"]

Clicar no botão "${BUTTON}" da popup
    Click Element      xpath=//*[@id="layer_cart"]//a[@title="${BUTTON}"]

Clicar no icone do carrinho de compras
    Click Element      xpath=//*[@id="header"]//a[@title="View my shopping cart"]

Clicar no botão de Remover item
    Click Element      xpath=//*[@id="1_1_0_0"][@title="Delete"]

Clicar no botão de "${BUTTON}" do header
    Click Element      xpath=//*[@id="header"]//a[contains(text(),"${BUTTON}")]

Digitar um email valido para gerar um nova conta
    #${FIRST_NAME}   Generate Random String   4
    #${LAST_NAME}    Generate Random String   4
    #${USER}          Catenate   SEPARATOR=_    ${FIRST_NAME}  ${LASTNAME}
    ${USER}   Generate Random String   8
    ${EMAIL}  Catenate   SEPARATOR=@    ${USER}      ${DOMAIN}
    ${EMAIL_FINAL}=   Set Variable   ${EMAIL}

    #Log    ${EMAIL_FINAL}

    Input Text          name=email_create    ${EMAIL}
    Log    "O Email digitado foi o ${EMAIL}!"

Preencher os campos obrigatorios
#     Input Text          name=customer_firstname    ${FIRST_NAME}
#     Input Text          name=customer_lastname     ${LAST_NAME}
#     Input Text          name=email                 ${EMAIL_FINAL}
#     Input Text          name=passwd                ${PASS}
#     Input Text          name=firstname             ${FIRST_NAME}
#     Input Text          name=lastname              ${LAST_NAME}
#     Input Text          name=address1              ${ADDR}
#     Input Text          name=city                  ${CITY}
#     Input Text          name=postcode              ${CODE}
#     Input Text          name=phone_mobile          ${PHONE}
#     Page Should Contain List    xpath=//*[@id="id_state"]
#     #@{AllItems}=        Get List Items             xpath=//*[@id="id_state"]
#     #${ListLabel}=       Get Selected List Label    xpath=//*[@id="id_state"]
#     #${ListValue}=       Get Selected List Value    xpath=//*[@id="id_state"]
#     Select From List By Index    xpath=//*[@id="id_state"]  1
#     ${LLabel1}    Get Selected List Label    xpath=//*[@id="id_state"]





#### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    IF    "${PRODUTO}" == "Blouse"
        Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    ELSE IF  "${PRODUTO}" == "T-shirts"
        Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/1/1-home_default.jpg']
    END
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be           xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Conferir se categoria "Women" foi mostrado no site   
    Wait until Element Is Visible    xpath=//*[@id="block_top_menu"]//ul[@style="display: block;"]   

Conferir se a pagina da subcategoria "${SUBCAT}" carregou corretamente
    Wait Until Element Is Visible    css=#center_column > div.content_scene_cat > div > div > span
    Title Should Be                  ${SUBCAT} - My Store

Conferir se a popup do cart apareceu
    Wait Until Element Is Visible    xpath=//*[@id="layer_cart"]
    Element Should Be Visible        xpath=//*[@id="layer_cart_product_title"]

Conferir se a pagina de "${PAGE}" apareceu corretamente com o titulo "${TITLE}"

    IF    "${TITLE}" == "Create an account"
        ${ID_XPATH} =   Set Variable  noSlide
    ELSE
        ${ID_XPATH} =   Set Variable  center_column
    END
#    Log   ${ID_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="${ID_XPATH}"]/h1[@class="page-heading"][contains(text(),"${TITLE}")]
    Title Should Be                  ${PAGE} - My Store

Conferir se "${QTY}" item do produto "${PRODUTO}" foi adicionado    
    Element Should Be Visible        xpath=//*[@id="product_1_1_0_0"]//a[contains(text(),"${PRODUTO}")]
    Element Should Be Visible        xpath=//*[@id="product_1_1_0_0"]//input[@type="text"][@value="${QTY}"]

