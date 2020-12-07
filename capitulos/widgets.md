# Criando Componentes (Widgets)
Os Componentes dos quais trataremos no Flutter são os Componentes Visuais que chamamos pelo nome inglês de Widgets. Já existe na internet diversos guias e tutoriais sobre como criar cada tipo widget. Listarei aqui alguns para que possa consultar posteriormente.

Nesse capítulo irei focar na composição de componentes para formar layouts mais complexos. Para isso eu estou usando diversos clones de aplicativos conhecidos internacionalmente para estudar como cada layout é construído utilizando os diversos tipos de componentes fornecidos pelo Flutter.

Na lista abaixo você pode ver os principais clones de aplicativos que eu estou utilizando para construir novos aplicativos:
 - Clone do Instagram
   - (Flutter-Instagram-UI-Clone)[https://github.com/iampawan/Flutter-Instagram-UI-Clone] do (@iampawan)[https://github.com/iampawan]
     - https://github.com/iampawan/Flutter-Instagram-UI-Clone
   - (Instagram Clone)[https://github.com/mohak1283/Instagram-Clone] do (@mohak1283)[https://github.com/mohak1283]
     -https://github.com/mohak1283/Instagram-Clone 
   - (Flutter_Instagram_Clone)[https://github.com/MarcusNg/flutter_instagram_clone] do (@MarcusNg)[https://github.com/MarcusNg]
 - Clone do WhatsApp
 - Aplicativo de quiz

Caso ainda não tenha matado a curiosidade, aqui vai algumas imagens:

<p>
<img src="https://raw.githubusercontent.com/felipebastosweb/flutter-book/master/assets/images/instagram_clone.jpg" alt="Flutter-Instagram-UI-Clone" width="400" height="700">

<img src="https://raw.githubusercontent.com/felipebastosweb/flutter-book/master/assets/images/whatsapp_clone.png" alt="Whatsapp-Clone" width="400" height="700">
</p>
 
Provavelmente a dica mais importante que você receberá desse capítulo é a indicação dos autores desses clones de aplicativo. Você verá que eles já criaram diversos clones que podem ser reaproveitados em seus projetos. E observe também que alguns deles já subdividiram o código em pacotes chamados de telas (screens), models ou domínio, widgets ou components, services, providers, etc. Outra coisa importante é observar como a tela está estruturada: possui os componentes principais (appbar, body e botton navigation), possui botões e imagens posicionadas, possui lista de dados, possui input de dados e possui tabs. Ao aprender fazer esses você já será capaz de criar as elas iniciais da maioria dos apps.

## Composição de Componentes
Nesse momento o principal clone do qual estou trabalhando é o clone de Instagram feito pelo (@iampawan)[https://github.com/iampawan]. Com certeza ele não é o melhor modelo de código Mas neste primeiro momento vai me permitir ir observar como cada componente foi composto. Eu quero observar como ele aninhou os componentes para posicionar e fazer a estilização. Conhecemos esse recurso em português como reconhecimento de padrões. nas telas do smartphone Esse reconhecimento de gestos pode ser muito útil tanto para parte de segurança como por exemplo na usabilidade dos recursos da tela ao mover elementos da tela de um lado a outro acionando ações pré-configuradas na tela do aplicativo.

### Telas ou Screens

## Laboratório 1 - Criando a Página de Login

## Laboratório 2 - Separando o Formulário de Login em um Widget

Como o Card de Login varia de estado de acordo com a interação do usuário foi necessário declará-lo como um StatefulWidget.
```
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  LoginCard({Key key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> { ... }
```

Declaração da Variável que vai controlar o estado do input password.
```
...
class _LoginCardState extends State<LoginCard> {

  bool passwordInvisible = true;

  void changePasswordInvisible() {
    setState(() {
      passwordInvisible = !passwordInvisible;
    });
  }
  ...
}
```

No LoginCardState, por conter informações de usuário e senha que são costumeiramente armazenadas e podem ser sugeridas ao usuário, foi utilizado o comando AutofillGroup para auxiliar no preenchimento dos inputs. 
```
...
  Widget build(BuildContext context) {
    return Container(
        child: AutofillGroup()
    )
  }
...
```

Em seguida utilizou-se os Widgets Container, Column e Row para formatar o layout do Card.

Para formatar os inputs dando um distanciamento eu utilizei o Widget Padding.
Durante minhas pesquisas verifiquei que muitos desenvolvedores ainda utilizam o componente TextField, mas foi utilizado o widget TextFormField por quê ele agrupa no mesmo widget as características de decoração, autopreenchimento e validação do input. 
```
...
          Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'felipeabm',
                  labelText: 'Username'),
              autofillHints: <String>[AutofillHints.username],
            ),
          ),
...
```
Nesse exemplo foi utilizado o paddind para dar distanciamento, o autovalidate automatico, o uso da borda para delimitar visualmente o input, e a sugestão de autopreenchimento de nome de usuário.

Já nesse exemplo usamos a variável passwordInvisible (do tipo boolean) para determinar se input deve se comportar como um input type=hidden (comparando com o HTML) ou não. Foi utilizado o evento onPressed para reagir ao click do botão com o ícone de visibilidade do input. Observe que no ícone foi utilizado um comando if .. else com o uso do ternário ?: para modificar o ícone de visibilidade demonstrado de acordo com o estado atual da variável passwordInvisible.
```
...
Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              obscureText: passwordInvisible,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(
                        passwordInvisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        changePasswordInvisible();
                      }),
                  hintText: '*************',
                  labelText: 'Password'),
              autofillHints: <String>[AutofillHints.newPassword],
            ),
          ),
...
```

...
...

É possível ver o código completo a seguir:
```
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  LoginCard({Key key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool passwordInvisible = true;

  void changePasswordInvisible() {
    setState(() {
      passwordInvisible = !passwordInvisible;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: AutofillGroup(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'felipeabm',
                  labelText: 'Username'),
              autofillHints: <String>[AutofillHints.username],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              obscureText: passwordInvisible,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(
                        passwordInvisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        changePasswordInvisible();
                      }),
                  hintText: '*************',
                  labelText: 'Password'),
              autofillHints: <String>[AutofillHints.newPassword],
            ),
          ),
        ],
      ),
    ));
  }
}

```

Obs: Já no caso do SignUpCard foi incluído um input que pede o e-mail do usuário. Foi incluída a validação automática do widget, que verifica se atende aos critérios ou não. Como o componente TextFormField permite o uso de validação, utilizou-se o atributo validator para fazer a validação do input da mesma forma que ocorreria no HTML com o input type="email". O comando if (!EmailValidator.validate(email)) verifica se o formato do texto atende aos critérios de e-mail válido.
```
...
Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'seu@gmail.com',
                  labelText: 'E-mail'),
              validator: (email) {
                if (!EmailValidator.validate(email)) {
                  return 'E-mail is invalid';
                }
                return 'E-mail válido';
              },
              autofillHints: <String>[AutofillHints.email],
            ),
          ),

...
```
A depender da lógica de negócio do seu sistema você pode colocar para checar no servidor se o e-mail pretendido já existe no sistema ou não. Caso o e-mail já esteja em uso isso pode ser indicado ao usuário, e pode ser sugerido variações de nome de e-mail que ainda não existem. Essa lógica não foi programada nesse exemplo.

# Laboratório 3 - Adicionando o Widget LoginCard a Página de Login
...

```
import 'package:flutter/material.dart';
import '../widgets/logincard.widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          LoginCard(),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (checked) {
                  setState(() {
                    rememberMe = checked;
                  });
                },
              ),
              Text('Remember me'),
            ],
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              //TODO: submit login form data
              Navigator.pushNamed(context, '/start');
            },
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

...
...
...
...


### Models ou Domains


### Services

A principal forma de serviço que descreverei neste capítulo é a obtenção de dados de forma externa a rede podendo ser pela internet ou na intranet da sua Lan.

### Providers

Uma outra forma de obter dados no seu aplicativo é utilizando provedores. um provedor muito importante de dados é o banco de dados que no Android se chama SQLite. Nesta seção utilizaremos os provedores para obter e armazenar dados no celular.

A gravação e obtenção de dados no banco de dados do celular é importante porque permite ao aplicativo funcionar mesmo quando o serviço de wi-fi ou dados de internet não está habilitada. Beijamos agora como eu estou configurando a utilização do aplicativo no modo offline.

Para utilizar o SQLite utilizarei a biblioteca padrão [sqflite versão 1.2.2+1](https://pub.dev/packages/sqflite) que pode ser encontrana no link a seguir:

`https://pub.dev/packages/sqflite`

Obs: É desnecessário dizer, mas mesmo assim o farei, que você deverá usar a versão mais recente da biblioteca e deve seguir o guia do usuário para a versão atual.

Para instalar essa biblioteca no seu projeto você deve editar o arquivo pubspec.yaml e incluir o nome da biblioteca e versão como no exemplo a seguir:

```
...
dependencies:
  sqflite: ^1.2.2+1
  cached_network_image: ^2.0.0
  flutter:
    sdk: flutter
...
```
Obs: É desnecessário dizer, mas mesmo assim o farei, que você deverá usar a versão mais recente da biblioteca e deve seguir o guia do usuário para a versão atual.

Caso você esteja usando um editor de código ou IDE que automatize alguns processos você pode seguir para o passo seguinte. Porém se o seu editor de código for mais simples você deve digitar o comando a seguir no terminal para que o Flutter instale essa biblioteca.

`flutter pub get`

Feito isto você já poderá utilizar o sqlite no seu aplicativo.

### Gestos ou Gesture Detector
Gestos nesta parte é a forma como tocamos no touch screen do nosso smartphone percorrendo uma parte da tela de forma a formar um caminho percorrido pelo dedo.
