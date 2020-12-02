# Iniciando a Aplicação
Todos os projetos Flutter começam com um arquivo main.dart onde é definido a primeira tela (MyHomePage). Nesta seção serão feitas algumas experiências sobre este arquivo.

## Laboratório 1 - Movendo a Página MyHomePage

Embora o Flutter incentive a criação de todo o código do aplicativos no arquivo main, para fins de desenvolvimento este arquivo foi reorganizado para que o código ficasse mais fácil de dar manutenção. Primeiro todo o código relacionado a página MyHomePage foi movido para o arquivo src/screens/home/home.page.dart. Em seguida foi feito o import do arquivo. E o código ficou semelhante ao demonstrado abaixo:

```
import 'package:flutter/material.dart';
import 'src/screens/home.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nome do App',
      theme: ThemeData(
        primarySwatch: Colors.white
      ),
      home: MyHomePage(),
    );
  }
}

```

## Laboratório 2 - Flexibilidade de Definição de Rotas
Ainda no apeifeiçoamento do arquivo que define a aplicação, era necessário que fosse possível mudar com mais facilidade a Página inicial do Aplicativo, e que fosse possível conhecer as rotas dele como ocorre em outros frameworks como o Ionic. Após pesquisas na Internet foi identificado 2 parâmetros do MaterialApp que permite definir as rotas como strings, que são o initialRoute e o routes, como demonstrado abaixo:

```
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => MyHomePage(title: 'Nome do App'),
          '/login': (_) => LoginPage(title: 'Login'),
          '/signup': (_) => SignUpPage(title: 'SignUp'),
          '/start': (_) => StartPage(title: 'Start Page'),
        });
  }
}
```
Desta forma, não apenas é possível entender a rota, como facilita a manutenção do fluxo de telas, e a internacionalização do aplicativo, pois as string que inicializam a página no atributo title podem ser traduzidas mais facilmente.

## Laboratório 3 - Definir como rota inicial a página start se existir usuário cadastrado
É muito comum vermos aplicativos que checam atuomaticamente se o usuário está cadastrado no app e entram automaticamente na página de timeline ou vão para a tela de Login/SignUp. Neste experimento será feita a experiência de mudar o valor de initialRoute de acordo com a existência de dados previamente cadastrados.
