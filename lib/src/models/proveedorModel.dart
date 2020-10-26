class ProveedorModel {
  ProveedorModel({
    this.id,
    this.nombre = '',
    this.apellidos = '',
    this.direccion = '',
    this.telefono = '',
  }) {
    if (this.id != null) {
      this.value = 'http';
    }
  }

  int id;
  String nombre;
  String apellidos;
  String direccion;
  String telefono;
  String value;

  factory ProveedorModel.fromJson(Map<String, dynamic> json) => ProveedorModel(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        direccion: json["direccion"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "direccion": direccion,
        "telefono": telefono,
      };
}
