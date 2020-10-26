import 'package:flutter/material.dart';

class ProductosPage extends StatelessWidget {
  const ProductosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          _listadoProducto(),
          _crearBoton(context),
        ],
      ),
    );
  }

  Widget _listadoProducto() {
    return Container(
      child: Text('Hola'),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5.0,
        // borderRadius: BorderRadius.circular(30.0),
        color: Colors.blueAccent,
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () => Navigator.pushReplacementNamed(context, 'fproducto'),
          child: Text(
            "Continuar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
