import 'dart:async';

import 'package:ultramarinos/src/models/productosModel.dart';
import 'package:ultramarinos/src/models/proveedorModel.dart';

class Validators {
  final validarHttpProveedor = StreamTransformer<List<ProveedorModel>,
      List<ProveedorModel>>.fromHandlers(handleData: (prov, sink) {
    final geoProv = prov.where((s) => s.value == 'http').toList();
    sink.add(geoProv);
  });

  final validarHttpProductos = StreamTransformer<List<ProductosModel>,
      List<ProductosModel>>.fromHandlers(handleData: (prod, sink) {
    final geoProd = prod.where((s) => s.value == 'http').toList();
    sink.add(geoProd);
  });
}
