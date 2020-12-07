# Definindo Fluxos das Telas
Ao pensarmos no Aplicativo devemos nos preocupar com a forma como o usuário interage com o Aplicativo. Além de construir telas fáceis de usar é importante delimitar o número de telas que o usuário terá de navegar para alcançar um objetivo. Devemos atentar para o fato de que quanto menos telas forem necessárias utilizar menor o risco do usuário abandonar o aplicativo. Então, vamos iniciar nosso capítulo com essa premissa de que menos é mais.

## Laboratório 1 - Rota Inicial
Justificativa: Quando iniciamos um aplicativo geralmente definimos uma tela home/início como tela inicial e nessa tela haverá os botões de login ou cadastre-se para poder-se identificar o usuário do aplicativo. Isso faz com que a tela de login, cadastre-se ou recuperar a senha se tornem a 2ª tela de interação do usuário. E a depender de como o aplicativo foi idealizado, a tela inicial do usuário logado será apenas a 3ª ou 4ª tela de interação. Isso é muito ruim, pois existe o risco do usuário ter de percorrer 3 telas para conseguir atingir o primeiro objetivo que é conseguir utilizar o App.
Objetivo: Construir uma tela inicial dinâmica que reduza o fluxo de autenticação para no máximo 2 telas, e criar um mecanismo que torne a tela de timeline (linha do tempo) do usuário logado a tela inicial se ele tiver cadastro.

## Laboratório 2 - Rotas Nomeadas
