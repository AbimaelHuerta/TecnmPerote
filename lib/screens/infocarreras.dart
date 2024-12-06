import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../assets/classes/Details.dart';

class InfoCarreras extends StatelessWidget {
  final Carrera carrera;
  const InfoCarreras({super.key, required this.carrera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverAppBar(
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'lib/assets/image/details.jpg',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.black.withOpacity(0.4), // Fondo negro con opacidad
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border(
                      top: BorderSide(color: Color(0xFF007C48), width: 5),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre de la carrera
                      Text(
                        carrera.carrera,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Especialidad
                      Row(
                        children: [
                          const Icon(
                            Icons.start,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Text(
                            carrera.especialidad,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Botón de Retícula
                      ElevatedButton.icon(
                        onPressed: () async {
                          try {
                            final url = Uri.parse(carrera.reticula);
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } 
                          } catch (e) {
                            throw 'Error al abrir el enlace: $e';
                          }
                        },
                        icon: const Icon(
                          Icons.text_snippet_rounded,
                          color: Color(0xFF2F3D6A),
                        ),
                        label: const Text(
                          'Reticula',
                          style: TextStyle(color: Color(0xFF007C48)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Descripción
                      Text(
                        carrera.descripcion,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          carrera.logo,
                          height: 125,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double
                      .infinity, //Hace que el contenedor o el fotter ocupe todo el ancho de la pantalla
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/image/fotterDetails.jpg',
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
      ),
    );
  }
}
