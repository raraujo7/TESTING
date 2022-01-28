*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
#Test Teardown       Fechar navegador

### SETUP: ele roda keyword antes da suite ou antes de um teste
### TEARDOWN: ele roda keyword depois de uma suite ou um teste

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão "pesquisar"
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão "pesquisar"
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women"        
    Conferir se categoria "Women" foi mostrado no site   
    Clicar na subcategoria "Summer Dresses"
    Conferir se a pagina da subcategoria "Summer Dresses" carregou corretamente

Caso de Teste 04: Adicionar Produtos no Carrinho
    Acessar a página home do site
    Digitar o nome do produto "T-shirts" no campo de pesquisa
    Clicar no botão "pesquisar"
    Conferir se o produto "T-shirts" foi listado no site
    Clicar no botão "Add to cart" do produto
    Conferir se a popup do cart apareceu
    Clicar no botão "Proceed to checkout" da popup
    Conferir se a pagina de "Order" apareceu corretamente com o titulo "Shopping-cart summary"
    Conferir se "1" item do produto "T-shirts" foi adicionado

Caso de Teste 05: Remover Produtos
    Acessar a página home do site
    #Clicar no icone do carrinho de compras
    Clicar no botão de "View my shopping cart" do header
    Conferir se a pagina de "Order" apareceu corretamente com o titulo "Shopping-cart summary"
    Clicar no botão de Remover item
    Conferir se a pagina de "Order" apareceu corretamente com o titulo "Shopping-cart summary"
    Conferir mensagem de erro "Your shopping cart is empty."

Caso de Teste 06: Adicionar Cliente
    Acessar a página home do site
    Clicar no botão de "Sign in" do header
    Conferir se a pagina de "Login" apareceu corretamente com o titulo "Authentication"
    Digitar um email valido para gerar um nova conta
    Clicar no botão "create"
    Conferir se a pagina de "Login" apareceu corretamente com o titulo "Create an account"
    Preencher os campos obrigatorios
    # Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    # Clicar no botão pesquisar
    # Conferir mensagem de erro "No results were found for your search "itemNãoExistente""        