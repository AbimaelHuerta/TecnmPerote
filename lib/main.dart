import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecnmperote/screens/carreras.dart';

void main() {
  // Ocultar la barra de navegación y la barra de estado
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(
          child: Carreras(),
        ),
      ),
    );
  }
}