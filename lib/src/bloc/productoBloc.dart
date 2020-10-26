import 'dart:async';

import 'package:ultramarinos/src/models/productosModel.dart';
import 'package:ultramarinos/src/providers/dbProvider.dart';
import 'package:ultramarinos/src/bloc/validator.dart';

class ProductoBloc with Validators {
  static final ProductoBloc _singleton = new ProductoBloc._internal();

  factory ProductoBloc() {
    return _singleton;
  }

  ProductoBloc._internal() {
    obtenerProduct();
  }

  final _productController = StreamController<List<ProductosModel>>.broadcast();

  Stream<List<ProductosModel>> get provStreamHttp =>
      _productController.stream.transform(validarHttpProductos);

  dispose() {
    _productController?.close();
  }

  obtenerProduct() async {
    _productController.sink.add(await DBProvider.db.getTodosProductos());
  }

  agregarProduct(ProductosModel product) async {
    await DBProvider.db.nuevoProducto(product);
    obtenerProduct();
  }

  borrarProduct(int id) async {
    await DBProvider.db.deleteProducto(id);
    obtenerProduct();
  }

  borrarProductTODOS() async {
    await DBProvider.db.deleteAllProductos();
    obtenerProduct();
  }
}
