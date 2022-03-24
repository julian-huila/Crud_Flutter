import 'package:crud_en_flutter/my_home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: MyHomePage(
            "Datos")); //llamamos la clase Myhomepage y pasamos por parámetro el titulo de esa pagina
  }
}
