import 'package:flutter/material.dart';
import 'package:tecnmperote/screens/infocarreras.dart';
import '../assets/classes/Details.dart';

class CarrerasDetails extends StatelessWidget {
  final Carrera carrera;
  const CarrerasDetails({super.key, required this.carrera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: InfoCarreras(carrera: carrera)));
  }
}
