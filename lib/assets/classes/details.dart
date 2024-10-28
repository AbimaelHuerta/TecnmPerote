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
