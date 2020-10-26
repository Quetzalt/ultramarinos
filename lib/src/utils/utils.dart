import 'package:flutter/material.dart';
import 'package:ultramarinos/src/models/proveedorModel.dart';
import 'package:ultramarinos/src/pages/paginasMenu/proveedorPage.dart';

bool isNumeric(String s) {
  // * Si s esta vacia retornamos false (quiere decir que no es un numero)
  if (s.isEmpty) return false;

  // * Preguntamos si se puede transformar a un numero
  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

abrirProv(BuildContext context, ProveedorModel prov) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProveedorPage()));
}
