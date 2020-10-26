import 'package:flutter/material.dart';
import 'package:ultramarinos/src/pages/formularios/formularioProductoPage.dart';
import 'package:ultramarinos/src/pages/homePage.dart';
import 'package:ultramarinos/src/pages/loginPage.dart';
import 'package:ultramarinos/src/pages/menuPage.dart';
import 'package:ultramarinos/src/pages/paginasMenu/listarProveedor.dart';
import 'package:ultramarinos/src/pages/registroPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultramarinos',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'registro': (BuildContext context) => RegistroPage(),
        'menu': (BuildContext context) => MenuPage(),
        'fproducto': (BuildContext context) => FormularioProductoPage(),
        'lproveedor': (BuildContext context) => ListarProveedor()
      },
    );
  }
}
