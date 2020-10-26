import 'package:flutter/material.dart';

import 'package:ultramarinos/src/bloc/productoBloc.dart';
import 'package:ultramarinos/src/models/productosModel.dart';

class FormularioProductoPage extends StatefulWidget {
  FormularioProductoPage({Key key}) : super(key: key);

  @override
  _FormularioProductoPageState createState() => _FormularioProductoPageState();
}

class _FormularioProductoPageState extends State<FormularioProductoPage> {
  String _nombre = '';
  String _precio = '';
  String _codigo = '';

  final formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final precioController = TextEditingController();
  final codigoController = TextEditingController();
  final proveedorController = TextEditingController();

  final productoBloc = new ProductoBloc();

  ProductosModel producto = new ProductosModel();

  @override
  Widget build(BuildContext context) {
    final ProductosModel productData =
        ModalRoute.of(context).settings.arguments;

    if (productData != null) {
      producto = productData;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar producto'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            SizedBox(height: 10),
            _crearNombre(),
            SizedBox(height: 5),
            // Dropdown(),
            SizedBox(height: 5),
            _crearPrecio(),
            _crearCodigo(),
            SizedBox(height: 30),
            _crearBoton(context)
          ],
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre del producto',
          labelText: 'Nombre',
          helperText: 'Introduzca el nombre',
          suffixIcon: Icon(Icons.control_point),
          icon: Icon(Icons.add_box)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tiene que colocar información";
        }
        return null;
      },
      controller: nombreController,
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_precio.length}'),
          hintText: 'Precio del producto',
          labelText: 'Precio',
          helperText: 'Introduzca el precio',
          suffixIcon: Icon(Icons.attach_money),
          icon: Icon(Icons.local_atm)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tiene que colocar información";
        }
        return null;
      },
      controller: precioController,
    );
  }

  Widget _crearCodigo() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_codigo.length}'),
          hintText: 'Código del producto',
          labelText: 'Código',
          helperText: 'Introduzca el código',
          suffixIcon: Icon(Icons.apps),
          icon: Icon(Icons.blur_circular)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tiene que colocar información";
        }
        return null;
      },
      controller: codigoController,
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
          child: Text(
            "Guardar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            if (formKey.currentState.validate()) {
              print("Guardado" + nombreController.text);
              productoBloc.agregarProduct(ProductosModel(
                  nombre: nombreController.text,
                  precio: precioController.text,
                  codigo: codigoController.text));
            }
          },
        ),
      ),
    );
  }
}
