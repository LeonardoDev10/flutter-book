# Iniciando uma Aplicação

## Laboratório 1 - Criando um projeto com package-id único

Para criar a aplicação deve-se criar um Diretório de Trabalho no seu sistema operacional. Você pode chamar seu diretório de: Laboratório, Lab, Flutter Apps, etc ou qualquer outro nome que desejar. Essas são apenas sugestões de nomes.

Dentro do diretório de trabalho abriu-se o terminal ou prompt de comandos e digitou-se o seguinte comando para que o flutter crie um esqueleto de código da sua aplicação.

`$> flutter create nome-do-app`

Obs 1: Troque a palavra "nome-do-app" por uma palavra que identifique seu App.
Obs 2: Fique atento as regras de nomenclaturas de nomes de aplicativo Android e aplicativos Flutter.

Ao criar os projetos dessa forma lembrou-se que poderia ocorrer o problema de package-id iguais que faz com que quando instalamos seu app no smartphone ele sobrepõe outro app que estamos desenvolvendo que tenha o mesmo package-id mas nomes diferentes. Lembrei que a melhor forma de criar os projetos é diferenciando os package-id's, e após pesquisa na Internet encontrei o comando a seguir:

`$> flutter create--org sua.estrutura-de-pacotes.nome-do-app nome-do-app `

Obs: Esse mesmo cuidado você deve ter antes de publicar o seu aplicativo na loja pois se você utilizar um package-id já existente a loja pode exigir que você defina outro package-id.

Pronto!
Agora já é possível iniciar o desenvolviento da aplicação, o que será feito no Laboratório 2.

## Laboratório 2 - Abrindo o Projeto do Aplicativo para Iniciar o Desenvolvimento

A primeira atitude é abrir o diretório da aplicação em um editor de código ou IDE, onde geralmente uso o Microsoft Visual Studio Code por ser mais leve que o Android Studio. Se você tiver uma máquina com 8GB de RAM ou mais é preferível que você use o Android Studio. Como minha máquina atualmente não tem os requisitos mínimos, e minha memória RAM é de apenas 4GB, eu uso o VSCode. Com ele eu tenho acesso ao Terminal e algumas extensões que facilitam o uso do Flutter. Mas se você quiser usar um editor de código mais simples como o Notepad++, Gedit, Atom, etc você deve seguir a segunda atitude.

A segunda postura ao usar um editor de código mais simples é abrir o terminal ou prompt de comandos na pasta do projeto. Como você já está com o terminal aberto execute o comando abaixo:

`$> cd nome-do-app`


[<< Instalação](instalacao.md) ou [Um parênteses para Debugging >>](debug.md)
