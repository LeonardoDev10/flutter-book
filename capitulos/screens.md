# Criação de Telas do Aplicativo

## Planejamento

Antes de continuarmos vamos fazer o planejamento do nosso aplicativo. Irei trabalhar com pelo menos 3 tipos de planejamento: Planejamento do Projeto, Planejamento do Produto e Planejamento de UI/UX.

### Planejamento de UI/UX

Existem diversas formas de planejar a UI/UX de um aplicativo para celular. A forma mais tradicional é usando wireframes em papel, e a forma mais utilizada que é via aplicativos web de prototipação de aplicativos mobile. Nesse planejamento falarei como estou fazendo o planejamento das telas, fluxo de navegação entre telas, e como as informações são mostradas ao usuário.

![Mockflow](https://www.mockflow.com/images/home-images2/mfHpBannerImage.png)

Uma das ferramentas que vejo muitos designers indicar é o [Figma](https://www.figma.com/) (https://www.figma.com/). Ainda não me aprofundei nela mas parece que além de planejar as telas você já obtém um material publicitário que serve para explicar como o aplicativo funciona para os seus clientes. Uma outra ferramenta mais antiga que é muito utilizada por designers web e mobile é a [Balsamiq](https://balsamiq.com/) (https://balsamiq.com/). Uma outra ferramenta que parece ser legal para fazer wireframes de baixa fidelidade é o [Mockflow](https://www.mockflow.com/) (https://www.mockflow.com/).


Bom, contarei a vocês o que estiver descobrindo sobre essas ferramentas à partir das experiências que eu tiver com elas.

## Permissões do Android

Agora eu já estou na pasta do projeto e posso rodar comandos flutter relacionados a esse projeto. Se você estiver usando o Windows e no seu sistema operacional não tiver atalhos para abrir o prompt de comandos então copie o caminho completo do diretório, execute o comando cmd.exe, e digite o comando abaixo:

`$> cd C:\Usuários\[Seu Usuário]\[Sua Pasta de Trabalho]\nome-do-app`

Antes de continuar, vamos aprender a Debugar a aplicação. Vai ser muito interessante ter uma versão da aplicação rodando de maneira testável no seu smartphone ou emulador Android.


```
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scaffold -> Center -> Column -> Text',
            ),
          ],
        ),
      ),
    );
  }
}
```

