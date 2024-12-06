import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecnmperote/assets/classes/Details.dart';
import 'package:tecnmperote/screens/maininfor.dart';

class Carreras extends StatefulWidget {
  const Carreras({super.key});

  @override
  State<Carreras> createState() => _CarrerasState();
}

class _CarrerasState extends State<Carreras> {
  List<Carrera> carreras = [];
  List<Carrera> maestria = [];

  @override
  void initState() {
    super.initState();
    _loadCarreras();
    _loadMaestria();
  }

  Future<void> _loadMaestria() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/infoMaestrias.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      maestria = data.map((json) => Carrera.fromJson(json)).toList();
    });
  }

  Future<void> _loadCarreras() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/infoCarreras.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      carreras = data.map((json) => Carrera.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 225,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'lib/assets/image/bar.jpg',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'lib/assets/image/PageOne.jpg',
                      width: 300,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Fichas del 1 de marzo al 26 de julio',
                      style: TextStyle(
                          color: Color(0xFF007C48),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const Text(
                      'Examen de admisión 27 de julio',
                      style: TextStyle(
                        color: Color(0xFF2F3D6A),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const Text(
                      'Inicio de clases 19 de agosto de 2023',
                      style: TextStyle(
                        color: Color(0xFF007C48),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: Image.asset(
                                        'lib/assets/image/Fichas-inscripcion.jpg'),
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.school,
                            color: Color(0xFF2F3D6A),
                          ),
                          label: const Text('Fichas',
                              style: TextStyle(color: Color(0xFF007C48))),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: Image.asset(
                                        'lib/assets/image/inscripcion.jpg'),
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.school,
                            color: Color(0xFF2F3D6A),
                          ),
                          label: const Text('Inscripción',
                              style: TextStyle(color: Color(0xFF007C48))),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 85),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF005E9E),
                                Color(0xFF00A056),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Text(
                          'Ingenierías',
                          style: TextStyle(
                            color: Colors
                                .white, // Color blanco para contrastar con el gradiente
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (carreras.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCardfirts(carreras[0], context),
                        ],
                      ),
                    const SizedBox(height: 10),
                    for (var i = 1; i < carreras.length; i += 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCard(carreras[i], context),
                          const SizedBox(width: 10),
                          if (i + 1 < carreras.length)
                            _buildCard(carreras[i + 1], context),
                        ],
                      ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 100),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF005E9E),
                                Color(0xFF00A056),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Text(
                          'Maestría',
                          style: TextStyle(
                            color: Colors
                                .white, // Color blanco para contrastar con el gradiente
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (maestria.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCardfirts(maestria[0], context),
                        ],
                      ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 40),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF005E9E),
                                Color(0xFF00A056),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Text(
                          'Formación Integral',
                          style: TextStyle(
                            color: Colors
                                .white, // Color blanco para contrastar con el gradiente
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'Acceso a Biblioteca Virtual',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Orientación Educativa',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Seguro Facultativo',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Educación Dual',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Tutorías',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  'lib/assets/image/Logo-ingenio-que-transforma.png',
                  width: 100,
                ),
              ),
              Container(
                width: double
                    .infinity, //Hace que el contenedor o el fotter ocupe todo el ancho de la pantalla
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/image/fotterMain.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildCard(Carrera carrera, BuildContext context) {
  void navigateToDetail(BuildContext context, Carrera carrera) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CarrerasDetails(carrera: carrera)));
  }

  return Expanded(
    child: InkWell(
      onTap: () {
        navigateToDetail(context, carrera);
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                carrera.logo,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCardfirts(Carrera carrera, BuildContext context) {
  void navigateToDetail(BuildContext context, Carrera carrera) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CarrerasDetails(carrera: carrera)));
  }

  return Column(
    children: [
      InkWell(
        onTap: () {
          navigateToDetail(context, carrera);
        },
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: ClipOval(
            child: Image.asset(
              carrera.logo,
              width: 150,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
      )
    ],
  );
}
