# Instalação

Para conseguir seguir este pequeno capítulo é necessário que você já esteja familiarizado com o seu sistema operacional, com o Ambiente Java, e consiga ler o manual de instruções do Android Studio para instalar ele completamente. Eu não farei nenhuma nota detalhada mostrando como fazer tais procedimentos.

## Ambiente de Desenvolvimento

Para utilizar o Flutter na criação de aplicativos primeiro você deve ser capaz de criar o ambiente de desenvolvimento. Temos 2 ambientes principais de desenvolvimento: Android (Google) e IOS (Apple).
Por enquanto eu apenas uso o ambiente Androi, então irei listar apenas os passos necessários para se criar esse ambiente. Quando eu tiver acesso ao ambiente IOS farei as atualizações dessas anotações, incluindo este ambiente.

### Android
Para trabalhar com Android você precisa instalar e configurar as ferramentas:
 - [Java JDK (Oracle)](https://www.oracle.com/java/technologies/javase-jdk13-downloads.html)
 - [Android Studio](https://developer.android.com/studio?hl=pt-br)
   - Android SDK
   - Android Tools
     - Baixar a imagem do Android mais recente no AVD (hoje é a versão 29)

Uma observação importante sobre esse ambiente: A versão do Java mais compatível com o Android é o Java 8 (1.8). Caso você prefira instalar uma versão mais recente como a 11, 12 ou 13, poderá ter incompatibilidades com o Androi em vários níveis. Eu trabalho com a versão 11 do Java, mas consigo debugar e gerar aplicativos. Então, se você for iniciante é melhor baixar o Java 8.

### Instalando o Flutter

Depois que o seu ambiente estiver rodando completamente e você for capaz de compilar um aplicativo Java Android, gerar um APK, e instalar ele APK em um dispositivo, você já está pronto para instalar o Flutter.

Você deve ir até a página de [Instalação do flutter](https://flutter.dev/docs/get-started/install) (https://flutter.dev/docs/get-started/install), baixar a versão do Flutter adequada para o seu sistema operacional, colocar em um diretório, incluir o endereço desse diretório na variável de ambiente PATH do seu sistema operacional, e usar o comando abaixo no terminal ou prompt de comandos para verificar se seu ambiente está pronto.

```
flutter doctor
```

Como o processo de criação do ambiente é tão fácil, e eu estou apenas fazendo anotações genéricas sobre como criei o ambiente, me reservo o direito de acreditar que qualquer pessoa com conhecimentos mínimos de informática conseguirá criar o ambiente. Então, vai lá pessoa guerreira. Você consegue!

Bom, se você chegou até aqui e continua empolgado é por que chegamos a principal parte. Vamos criar um App mobile. Uhuu!!!

[Iniciando uma Aplicação >>](starting.md)
