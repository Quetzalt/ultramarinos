import 'package:flutter/material.dart';

import 'package:ultramarinos/src/bloc/proveedorBloc.dart';
import 'package:ultramarinos/src/models/proveedorModel.dart';

class ProveedorPage extends StatefulWidget {
  ProveedorPage({Key key}) : super(key: key);

  @override
  _ProveedorPageState createState() => _ProveedorPageState();
}

class _ProveedorPageState extends State<ProveedorPage> {
  String _nombre = '';
  String _apellidos = '';
  String _direccion = '';
  String _telefono = '';

  final formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final apellidosController = TextEditingController();
  final direccionController = TextEditingController();
  final telefonoController = TextEditingController();

  ProveedorModel proveedor = new ProveedorModel();

  final proveedorBloc = new ProveedorBloc();

  @override
  Widget build(BuildContext context) {
    final ProveedorModel provData = ModalRoute.of(context).settings.arguments;
    final ProveedorModel prov = ModalRoute.of(context).settings.arguments;
    // _init(prov);

    if (provData != null) {
      proveedor = provData;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Proveedor'),
      ),
      body: _formulario(prov),
    );
  }

  Widget _formulario(ProveedorModel prov) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          SizedBox(height: 60),
          _crearNombre(),
          _crearApellido(),
          _crearDireccion(),
          _crearTelefono(),
          SizedBox(height: 50),
          _crearBoton(context, prov),
          SizedBox(height: 10),
          _verProveedores(context)
        ],
      ),
    );
  }

  // _init(ProveedorModel prov) {
  //   nombreController.text = prov.nombre;
  //   apellidosController.text = prov.apellidos;
  //   direccionController.text = prov.direccion;
  //   telefonoController.text = prov.telefono;
  // }

  Widget _crearNombre() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre del proveedor',
          labelText: 'Nombre',
          helperText: 'Introduzca el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.accessibility_new)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tienes que colocar información";
        }
        return null;
      },
      controller: nombreController,
    );
  }

  Widget _crearApellido() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_apellidos.length}'),
          hintText: 'Apellidos del proveedor',
          labelText: 'Apellidos',
          helperText: 'Introduzca los Apellidos',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.accessibility_new)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tienes que colocar información";
        }
        return null;
      },
      controller: apellidosController,
    );
  }

  Widget _crearDireccion() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_direccion.length}'),
          hintText: 'Dirección del proveedor',
          labelText: 'Dirección',
          helperText: 'Introduzca la dirección',
          suffixIcon: Icon(Icons.directions),
          icon: Icon(Icons.rate_review)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tienes que colocar información";
        }
        return null;
      },
      controller: direccionController,
    );
  }

  Widget _crearTelefono() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_telefono.length}'),
          hintText: 'Telefono del proveedor',
          labelText: 'Telefono',
          helperText: 'Introduzca el telefono',
          suffixIcon: Icon(Icons.phone),
          icon: Icon(Icons.phone_in_talk)),
      validator: (value) {
        if (value.isEmpty) {
          return "Tienes que colocar información";
        }
        return null;
      },
      controller: telefonoController,
    );
  }

  Widget _crearBoton(BuildContext context, ProveedorModel prov) {
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
              if (prov.id > 0) {
                // Actualización
                prov.nombre = nombreController.text;
                prov.apellidos = apellidosController.text;
                prov.direccion = direccionController.text;
                prov.telefono = telefonoController.text;

                proveedorBloc..editarProv(prov);
              } else {
                // Registro
                proveedorBloc.agregarProv(ProveedorModel(
                    nombre: nombreController.text,
                    apellidos: apellidosController.text,
                    direccion: direccionController.text,
                    telefono: telefonoController.text));
              }
            }
          },
        ),
      ),
    );
  }

  Widget _verProveedores(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5.0,
        // borderRadius: BorderRadius.circular(30.0),
        color: Colors.blueAccent,
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text(
            "Ver Proveedores",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'lproveedor');
          },
        ),
      ),
    );
  }
}
