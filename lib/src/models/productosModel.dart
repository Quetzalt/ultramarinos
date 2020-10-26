class ProductosModel {
  ProductosModel({
    this.id = 1,
    this.nombre = '',
    this.proveedor = '',
    this.precio = '',
    this.codigo = '',
  }) {
    if (this.id != null) {
      this.value = 'http';
    }
  }

  int id;
  String nombre;
  String proveedor;
  String precio;
  String codigo;
  String value;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        id: json["id"],
        nombre: json["nombre"],
        proveedor: json["proveedor"],
        precio: json["precio"],
        codigo: json["codigo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "proveedor": proveedor,
        "precio": precio,
        "codigo": codigo,
      };
}
