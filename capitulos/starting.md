# Iniciando uma Aplicação

Para criar a sua primeira aplicação primeiro crie um Diretório de Trabalho no seu sistema operacional. Você pode chamar seu diretório de: Laboratório, Lab, Flutter Apps, etc. Essas são apenas sugestões de nomes. É importante que você coloque em um lugar fácil de trabalhar e protegido de outros usuários do seu sistema operacional.

No diretório de trabalho você deve abrir o terminal ou prompt de comandos e digitar o seguir comando para que o flutter crie um esqueleto de código da sua aplicação. Troque a palavra "nome-do-app" por uma palavra que identifique seu App. Fique atento as regras de nomenclaturas de nomes de aplicativo Android e aplicativos Flutter.

`$> flutter create nome-do-app`

Agora que já criei a aplicação, tenho como padrão tomar 2 atitudes. A primeira atitude é abrir o diretório da aplicação em um editor de código ou IDE, onde geralmente uso o Microsoft Visual Studio Code por ser mais leve que o Android Studio. Se você tiver uma máquina com 8GB de RAM ou mais é preferível que você use o Android Studio. Como minha máquina atualmente não tem os requisitos mínimos, e minha memória RAM é de apenas 4GB, eu uso o VSCode. Com ele eu tenho acesso ao Terminal e algumas extensões que facilitam o uso do Flutter. Mas se você quiser usar um editor de código mais simples como o Notepad++, Gedit, Atom, etc você deve seguir a segunda atitude.

A segunda postura ao usar um editor de código mais simples é abrir o terminal ou prompt de comandos na pasta do projeto. Como você já está com o terminal aberto execute o comando abaixo:

`$> cd nome-do-app`

## Planejamento

Antes de continuarmos vamos fazer o planejamento do nosso aplicativo. Irei trabalhar com pelo menos 2 tipos de planejamento: Planejamento do Projeto e Planejamento de UI/UX.


### Planejamento de UI/UX

Existem diversas formas de planejar a UI/UX de um aplicativo para celular. A forma mais tradicional é usando wireframes em papel, e a forma mais utilizada que é via aplicativos web de prototipação de aplicativos mobile. Nesse planejamento falarei como estou fazendo o planejamento das telas, fluxo de navegação entre telas, e como as informações são mostradas ao usuário.

![Mockflow](https://www.mockflow.com/images/home-images2/mfHpBannerImage.png)

Uma das ferramentas que vejo muitos designers indicar é o [Figma](https://www.figma.com/) (https://www.figma.com/). Ainda não me aprofundei nela mas parece que além de planejar as telas você já obtém um material publicitário que serve para explicar como o aplicativo funciona para os seus clientes. Uma outra ferramenta mais antiga que é muito utilizada por designers web e mobile é a [Balsamiq](https://balsamiq.com/) (https://balsamiq.com/). Uma outra ferramenta que parece ser legal para fazer wireframes de baixa fidelidade é o [Mockflow](https://www.mockflow.com/) (https://www.mockflow.com/).


Bom, contarei a vocês o que estiver descobrindo sobre essas ferramentas à partir das experiências que eu tiver com elas.

## Permissões do Android

Agora eu já estou na pasta do projeto e posso rodar comandos flutter relacionados a esse projeto. Se você estiver usando o Windows e no seu sistema operacional não tiver atalhos para abrir o prompt de comandos então copie o caminho completo do diretório, execute o comando cmd.exe, e digite o comando abaixo:

`$> cd C:\Usuários\[Seu Usuário]\[Sua Pasta de Trabalho]\nome-do-app`

Antes de continuar, vamos aprender a Debugar a aplicação. Vai ser muito interessante ter uma versão da aplicação rodando de maneira testável no seu smartphone ou emulador Android.

[<< Instalação](instalacao.md) ou [Um parênteses para Debugging >>](debug.md)
