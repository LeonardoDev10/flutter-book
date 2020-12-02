


```
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

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
      home: MyHomePage(title: 'Título da Página MyHome'),
    );
  }
}

```




