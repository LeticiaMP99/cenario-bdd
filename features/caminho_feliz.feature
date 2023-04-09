Feature: Reservas de Quartos Desbravador - Caminho Feliz. Verificar disponibilidade de no mínimo 3 dias para o quarto STANDART ST1 com 2 adultos e uma criança de 0-6 anos. 

  Scenario: Verificar disponibilidade de no mínimo 3 dias para o quarto STANDART ST1 
    Given que o usuário seleciona um período de 3 dias no calendário
    And adiciona número 2 no campo "Adultos"
    And clica no campo "0 - Crianças"
    And adiciona número 1 no campo "Criança(s) 0 - 6 Anos - FREE"
    When clicar no botão "Verificar Disponibilidade"
    Then deve exibir os resultados da reserva do quarto STANDART ST1 

  Scenario: Adicionar a reserva ao carrinho
    Given que o usuário efetuou o filtro com os campos obrigatórios
    When clicar em "adicionar"
    Then deve adicionar a reserva ao carrinho

  Scenario: Verificar dados dos hóspedes antes do check-out
    Given que o usuário efetuou um filtro com os campos obrigatórios
    And adicionou a reserva ao carrinho
    When clicar em "continuar" na reserva do carrinho
    Then deve direcionar a tela de informações dos hóspedes /hotel-app/hotel-teste-desbravador-8050/step3
    
  Scenario: Concluir reserva do quarto STANDART ST1 com cartão de crédito
    Given que o usuário está na tela de check-out do STANDART ST1 hotel-app/hotel-teste-desbravador-8050/checkout
    And preencher os dados do cartão de crédito
    And clicar em "finalizar"
    Then deve exibir que a reserva foi concluída com sucesso

  Scenario: Erro ao concluir a reserva do quarto STANDART ST1
    Given que o usuário está na tela de check-out do STANDART ST1 hotel-app/hotel-teste-desbravador-8050/checkout
    And não preencher os dados corretos do cartão de crédito
    And clicar em "finalizar"
    Then deve exibir os campos obrigatórios para correção

  Scenario: Erro ao concluir a reserva do quarto STANDART ST1
    Given que o usuário está na tela de check-out do STANDART ST1 hotel-app/hotel-teste-desbravador-8050/checkout
    And não concluir a validação reCAPTCHA
    And clicar em "finalizar"
    Then deve exibir um aviso em tela

  Scenario: Erro ao concluir a reserva do quarto STANDART ST1
    Given que o usuário está na tela de check-out do STANDART ST1 hotel-app/hotel-teste-desbravador-8050/checkout
    And não marcar o check-box de "Concordo com as políticas do hotel"
    And clicar em "finalizar"
    Then deve exibir um aviso em tela