import 'package:flutter/material.dart';
import 'package:ultramarinos/src/bloc/proveedorBloc.dart';
import 'package:ultramarinos/src/models/proveedorModel.dart';
import 'package:ultramarinos/src/utils/utils.dart' as utils;

class ListarProveedor extends StatelessWidget {
  final provBloc = new ProveedorBloc();

  @override
  Widget build(BuildContext context) {
    provBloc.obtenerProv();

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Proveedores')),
      body: _crearListado(),
    );
  }

  Widget _crearListado() {
    return StreamBuilder<List<ProveedorModel>>(
      stream: provBloc.provStreamHttp,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProveedorModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final prov = snapshot.data;

        if (prov.length == 0) {
          return Center(
            child: Text('No hay información'),
          );
        }

        return ListView.builder(
            itemCount: prov.length,
            itemBuilder: (context, i) => Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (direction) => provBloc.borrarProv(prov[i].id),
                child: ListTile(
                  leading: Icon(Icons.cloud_queue,
                      color: Theme.of(context).primaryColor),
                  title: Text(prov[i].nombre),
                  subtitle: Text('ID: ${prov[i].id}'),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  onTap: () => utils.abrirProv(context, prov[i]),
                )));
      },
    );
  }
}
