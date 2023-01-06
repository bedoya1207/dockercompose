
class Comida {


  Comida(
      {required this.id,
      required this.nombre,
      required this.precio,
      required this.calorias});

  int id;
  String nombre;
  String precio;
  String calorias;

  factory Comida.fromJson(Map<String, dynamic> json) => Comida(
      id: json["id"],
      nombre: json["nombre"],
      precio: json["precio"],
      calorias: json["calorias"]);

  Map<String, dynamic> toJson()=>{
    "id":id,
    "nombre":nombre,
    "precio":precio,
    "calorias":calorias
  };
}
