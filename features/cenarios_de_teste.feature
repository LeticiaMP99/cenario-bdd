Feature: Reservas de Quartos Desbravador

  Scenario: Verificar disponibilidade de no mínimo 3 dias para o quarto STANDART ST1 
    Given que o usuário seleciona um período de 3 dias no calendário
    And adiciona número 2 no campo "Adultos"
    And clica no campo "0 - Crianças"
    And adiciona número 1 no campo "Criança(s) 0 - 6 Anos - FREE"
    When clicar no botão "Verificar Disponibilidade"
    Then deve exibir os resultados da reserva do quarto STANDART ST1 

  Scenario: Verificar reservas
    Given que o usuário seleciona um período no calendário
    When clicar no botão "Verificar Disponibilidade"
    Then deve exibir os quartos disponíveis para reserva

  Scenario: Verificar valor da reserva sem alteração
    Given que o usuário seleciona um período no calendário
    And adiciona 1 no campo "Criança(s) 0 - 6 Anos - FREE"
    When clicar no botão "Verificar Disponibilidade"
    Then o valor total da reserva não deve ser alterado

  Scenario: Verificar valor da reserva alterado
    Given que o usuário vai alterar a reserva
    When adiciona 1 no campo "Criança(s) 7 - 12 Anos"
    Then o valor total da reserva deve ter alteração

  Scenario: Adicionar a reserva ao carrinho
    Given que o usuário efetuou um filtro com os campos obrigatórios
    When clicar em "adicionar"
    Then deve adicionar a reserva ao carrinho

  Scenario: Verificar dados dos hóspedes antes do check-out
    Given que o usuário efetuou um filtro com os campos obrigatórios
    And adicionou a reserva ao carrinho
    When clicar em "continuar" na reseva do carrinho
    Then deve direcionar a tela de informações dos hóspedes /hotel-app/hotel-teste-desbravador-8050/step3
    
  Scenario: Concluir reserva do quarto STANDART ST1
    Given que o usuário está na tela de check-out do STANDART ST1 hotel-app/hotel-teste-desbravador-8050/checkout
    And preencher os dados obrigatórios em tela
    And clicar em "finalizar"
    Then deve exibir que a reserva foi concluída com sucesso

  Scenario: Erro ao concluir a reserva do quarto STANDART ST1
    Given que o usuário está na tela de check-out do STANDART ST1 hotel-app/hotel-teste-desbravador-8050/checkout
    And não preencher os dados obrigatórios de pagamento em tela
    And clicar em "finalizar"
    Then deve exibir os campos obrigatórios para preenchimento

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


Obs. e no caso de reservas que tem 2 ou mais crianças de 0 a 6 anos? 
Não permite inclusão na reserva? No caso, não deveria ter o aviso que apenas 1 é free
e a partir da segunda criança, adicionar valor no total da reserva? 
Obs2.na tela https://reservas.desbravador.com.br/hotel-app/hotel-teste-desbravador-8050/checkout
no campo "telefone" vem por padrão false, seria interessante vir em branco assim como os demais na tela
e também com uma restrição de caracteres
Obs.3 na tela mencionado acima aparece "código CVC", não seria CVV? (no hint está certo)