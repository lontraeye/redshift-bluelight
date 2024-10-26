Projeto: Ajuste de Luz no Arch Linux com Polybar e Redshift

Este projeto visa ajustar as configurações de luz do seu sistema Arch Linux usando o redshift, uma ferramenta que altera a temperatura de cor da tela para reduzir a luz azul e aplicar um filtro laranja, 
promovendo um ambiente mais relaxante à noite. O projeto integra um script de shell que utiliza um sistema de ícones cíclicos na barra de tarefas Polybar, permitindo alternar facilmente entre diferentes modos de luz.
Funcionalidades

Ciclos de Ícones: O script utiliza três ícones diferentes para representar diferentes estados de iluminação:

        Ícone 1: Filtro laranja automatico, baseado na hora do dia.
        Ícone 2: Filtro laranja fixo, ajuste como necessario.
        Ícone 3: Desligar o filtro de cor (restaurar a luz normal).
        
Integração com Redshift: O script controla o redshift para aplicar as mudanças 
de temperatura de cor de acordo com a escolha do usuário.

Requisitos

Redshift: O redshift deve estar instalado.

Fonte Material Symbols Rounded (Opcional, voce pode optar por outra fonte de simbolos em unicode, basta alterar o uso da fonte e o codigo unicode do icone desejado)

Dê Permissão de Execução:

Execute o seguinte comando para tornar o script executável:

    chmod +x redshift-bluelight.sh

Executar o Script:

  Para mostrar o ícone atual:
  
    ./redshift-bluelight.sh mostrar

  Para mudar a luz:

    ./redshift-bluelight.sh incrementar

Integração com Polybar

Para integrar o script ao Polybar, você pode adicionar um bloco de módulo no arquivo de configuração do Polybar (~/.config/polybar/config) com um comando que chama o script:

        [module/redshift]
        type = custom/script
        exec = /home/lontra/.config/scripts/redshift-bluelight.sh mostrar
        interval = 0
        click-left = /home/lontra/.config/scripts/redshift-bluelight.sh incrementar
        label-font = 2

Voce tambem deve adicionar a fonte personalizada no escopo do polybar:

        font-0 = "Fonte exemplo:size=11;6"
        font-1 = "Material Symbols Rounded:style=Bold:size=11;6"

altere o tamanho conforme necessario, no exemplo acima, para simular meu ambiente, utilizei duas fontes, entao para definir a fonte para o icone voce deve usar o label-font com o numero apropriado:

font-0 deve usar label-font = 1
font-1 deve usar label-font = 2
