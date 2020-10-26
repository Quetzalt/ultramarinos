import 'dart:async';

import 'package:ultramarinos/src/models/proveedorModel.dart';
import 'package:ultramarinos/src/providers/dbProvider.dart';
import 'package:ultramarinos/src/bloc/validator.dart';

class ProveedorBloc with Validators {
  static final ProveedorBloc _singleton = new ProveedorBloc._internal();

  factory ProveedorBloc() {
    return _singleton;
  }

  ProveedorBloc._internal() {
    obtenerProv();
  }

  final _provController = StreamController<List<ProveedorModel>>.broadcast();

  Stream<List<ProveedorModel>> get provStreamHttp =>
      _provController.stream.transform(validarHttpProveedor);

  dispose() {
    _provController?.close();
  }

  obtenerProv() async {
    _provController.sink.add(await DBProvider.db.getTodosProveedor());
  }

  agregarProv(ProveedorModel proveedor) async {
    await DBProvider.db.nuevoProveedor(proveedor);
    obtenerProv();
  }

  borrarProv(int id) async {
    await DBProvider.db.deleteProveedor(id);
    obtenerProv();
  }

  borrarProvTODOS() async {
    await DBProvider.db.deleteAllProveedor();
    obtenerProv();
  }
}
