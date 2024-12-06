//clase del objeto Carrera para su manipulación
class Carrera {
  final String carrera;
  final String especialidad;
  final String descripcion;
  final String logo;
  final String reticula;

  Carrera(
      {required this.carrera,
      required this.descripcion,
      required this.logo,
      required this.especialidad,
      required this.reticula
      });
//constructor que crea instancias o objetos de la clase carrera
  factory Carrera.fromJson(Map<String, dynamic> json) {
    return Carrera(
        carrera: json['carrera'],
        descripcion: json['descripcion'],
        logo: json['logo'],
        especialidad: json['especialidad'],
        reticula: json['reticula']
        );
  }
}
