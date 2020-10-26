import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ultramarinos/src/models/productosModel.dart';
import 'package:ultramarinos/src/models/proveedorModel.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'CartellanoDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Proveedor('
            'id INTEGER PRIMARY KEY,'
            'nombre TEXT,'
            'apellidos TEXT,'
            'direccion TEXT,'
            'telefono TEXT'
            ')');
        await db.execute('CREATE TABLE Producto('
            'id INTEGER PRIMARY KEY,'
            'nombre TEXT,'
            'proveedor TEXT,'
            'precio TEXT,'
            'codigo TEXT'
            ')');
      },
    );
  }

  //Crear registros
  nuevoProveedor(ProveedorModel newProvider) async {
    final db = await database;

    final res = await db.rawInsert(
        "INSERT Into Proveedor (id, nombre, apellidos, direccion, telefono)"
        "VALUES (${newProvider.id}, '${newProvider.nombre}', '${newProvider.direccion}', '${newProvider.direccion}','${newProvider.telefono}')");

    return res;
  }

  nuevoProducto(ProductosModel newProduct) async {
    final db = await database;

    final res = await db.rawInsert(
        "INSERT Into Producto (id, nombre, proveedor, precio, codigo)"
        "VALUES (${newProduct.id}, '${newProduct.nombre}', '${newProduct.proveedor}', '${newProduct.precio}', '${newProduct.codigo}')");

    return res;
  }

  //Obtener información
  //? Proveedor
  Future<ProveedorModel> getProveedorId(int id) async {
    final db = await database;
    final res = await db.query('Proveedor', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ProveedorModel.fromJson(res.first) : null;
  }

  Future<List<ProveedorModel>> getTodosProveedor() async {
    final db = await database;
    final res = await db.query('Proveedor');

    List<ProveedorModel> list = res.isNotEmpty
        ? res.map((c) => ProveedorModel.fromJson(c)).toList()
        : [];
    return list;
  }

  //? Productos
  Future<ProductosModel> getProductosId(int id) async {
    final db = await database;
    final res = await db.query('Producto', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ProductosModel.fromJson(res.first) : null;
  }

  Future<List<ProductosModel>> getTodosProductos() async {
    final db = await database;
    final res = await db.query('Producto');

    List<ProductosModel> list = res.isNotEmpty
        ? res.map((c) => ProductosModel.fromJson(c)).toList()
        : [];
    return list;
  }

  // Actualizar Registros
  //? Proveedor
  Future<int> updateProveedor(ProveedorModel nuevoProveedor) async {
    final db = await database;
    final res = await db.update('Proveedor', nuevoProveedor.toJson(),
        where: 'id = ?', whereArgs: [nuevoProveedor.id]);
    return res;
  }

  //? Productos
  Future<int> updateProductos(ProductosModel nuevoProducto) async {
    final db = await database;
    final res = await db.update('Producto', nuevoProducto.toJson(),
        where: 'id = ?', whereArgs: [nuevoProducto.id]);
    return res;
  }

  // Eliminar registros
  //? Proveedor
  Future<int> deleteProveedor(int id) async {
    final db = await database;
    final res = await db.delete('Proveedor', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllProveedor() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Proveedor');
    return res;
  }

  //? Productos
  Future<int> deleteProducto(int id) async {
    final db = await database;
    final res = await db.delete('Producto', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllProductos() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Producto');
    return res;
  }
}
