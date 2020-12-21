# Domínio do Negócio
É a parte do sistema em que os nomes de classe, métodos de classe, variáveis devem corresponder ao domínio do negócio de uma empresa ou organização de pessoas. De forma prática, significa dizer que quando uma pessoa ler o código fonte do sistema deverá compreender como o negócio (business) funciona.

Será adotado neste trabalho o seguinte modelo de fluxo de dados:
 1. O método principal de acesso aos dados será através de acesso ao banco SQlite;
 2. Outros dados com baixo volume serão consultados nas Preferências de Usuário;
 3. Será consultado a existência de novos dados na API remota, porém, em menor frequência;
 4. Haverá um modelo padrão de classe de domínio para facilitar a troca de informações entre os repositorios de dados citados acima.

Por conta desse protocolo de comunicação entre os repositório de dados foi começado o desenvolvimento do domínio pelo protocolo comum de comunicação. Foi criada a pasta src/domains/models para organizar os arquivos desse pacotes de classes.

## Laboratório 1 - Automatizar a criação de funções de conversão fromJson e toJson
Esse trecho não é obrigatório, mas queríamos entender como é possível gerar automaticamente esse trecho do sistema visando otimizar a produtividade do desenvolvimento do mesmo. Nesse método deixaremos a criação do código de Serialização com a ferramenta automática.

No arquivo pubspec.yaml foram definidos os pacotes json_annotation e json_serialization (pesquise a versão mais recente para usar no seu projeto). São esses pacotes que auxiliam na geração automática do domínio. 
```
dependencies:
  flutter:
    sdk: flutter
  json_annotation: ^3.1.1
  json_serializable: ^3.5.0

```
Mas, o pacote que realmente gera o novo arquivo como parte do domínio é o build_runner. Defini ele na seção de dev_dependencies, como indicado pelo guia do mesmo. Deixo aqui a mesma dica, pesquise a versão mais recente na hora de instalar no seu projeto.
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^1.10.6
```
Se o seu ambiente dev tiver bem configurado esses pacotes serão baixados automaticamente. Se isso não ocorrer, abra a pasta do projeto no terminal/prompt de comandos e execute o comando pub get.

```
flutter pub get
```

Depois de configurar o projeto foi definido um modelo do domínio para experimentar a ferramenta. O domínio em questão é a definição de Usuário do aplicativo.
```
import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  final int id;
  final String email;
  final String nome;
  final String senha;
  
  Usuario(this.id, this.email, this.nome, this.senha);

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
```
Depois disso, já é possível gerar automaticamente o arquivo usuario.g.dart usando o comando build_runner. Tem 2 possibilidades, uma que fica rodando o tempo todo aguardando que um domínio do projeto seja modificado, e um outro que executa apenas 1.
Nesse comando watch o build_runner fica ativo no terminal aguardando alguma modificação de domínio para gerar automaticamente a parte.
```
flutter pub run build_runner watch
```
É importante lembrar que nenhuma configuração adicional no projeto é necessária pois o build_runner identifica a presença do código "part 'filename.g.dart';" e só executa a geração nesse arquivo. Existem outros critérios que também não podem ser esquecidos na geração automática:
 - É obrigatório declarar o import do json_annotation;
 - É obrigatório declarar apenas um part para cada arquivo. Podem ter várias classes models no mesmo arquivo.
 - É obrigatório identificar a classe model com a anotação @JsonSerializable(). Se a classe não for precedida por esse comando não será gerada.
 - É necessário declarar todos os atributos corretamente e todos os atributos devem ser inicializados no construtor.
 - É obrigatório declarar corretamente os métodos _$(NomeDaClasse)FromJson e _$(NomeDaClasse)ToJson. Se o nome da classe estiver errado o arquivo .g.dart não será gerado.
```
flutter pub run build_runner build
```
Já o comando acima executa uma única vez. É o ideal para computadores modestos com 4GB de RAM como o que foi usado neste experimento (podem haver pequenos travamentos mesmo assim).
Obs: Você deve escolher qual comando usar de acordo com a capacidade de processamento do seu computador.

O arquivo usuario.g.dart gerado tem as seguintes características:
```
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    json['id'] as int,
    json['email'] as String,
    json['nome'] as String,
    json['senha'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'senha': instance.senha,
    };

```
Pode até parecer pouco, mas a medida que você vai aumentando o tamanho do seu app, e fazendo modificações no domínio, esse já um auxílio considerável, pois mais do que gerar o código ele verifica se a sintaxe do seu domínio está correta, evitando perdas valiosas de horas corrigindo pontuação ou erros de digitação do código.

## Armazenando Dados no Sqlite

Um dos grandes desafios da tecnologia mobile é decidir o que?, como? e por quanto tempo armazenar as informações no dispositivo. Uma das formas mais importantes de armazenar dados estruturados é através do banco de dados. E, nos smartphones um dos bancos de dados mais utilizados é o Sqlite, que é um pequeno sistema de banco de dados presente nas plataformas Android e IOS. Nesta seção vamos analisar quais dados devem ser estruturados, e como devemos armazenar eles no banco de forma a ser facilmente integrado com a API remota do backend.

## Laboratório _ - Instalação do Moor ORM

```
dependencies:
 moor: ^3.0.0
 sqlite3_flutter_libs:
 sqflite: ^1.1.7 # Still used to obtain the database location
dev_dependencies:
 moor_generator: ^3.0.0
```


## Laboratório _ - Criação de Tabelas do Banco de Dados


```
import 'package:moor/moor.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'filename.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
@DataClassName("Todo")
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

@UseMoor(tables: [Todos, Categories])
class MyDatabase {
  
}

```

// https://moor.simonbinder.eu/docs/examples/relationships/
