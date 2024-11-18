import 'dart:async'; // Para usar o Timer
import 'package:flutter/material.dart';
import 'package:terceiroprojeto/pages/login.dart';
import 'package:terceiroprojeto/shared/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => Login(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String text = "Symphonie"; // Defina o texto desejado
  String displayedText = ""; // Texto que será exibido gradualmente
  int currentIndex = 0; // Índice da letra atual

  @override
  void initState() {
    super.initState();

    // Calcula o intervalo para cada letra aparecer
    int interval = text.isNotEmpty ? (3026 / text.length).round() : 3026;

    Timer.periodic(Duration(milliseconds: interval), (Timer timer) {
      if (currentIndex < text.length) {
        setState(() {
          displayedText += text[currentIndex]; // Adiciona a próxima letra
          currentIndex++;
        });
      } else {
        timer.cancel();
        // Aguarda 1.5 segundos após o texto completo e muda para a tela de login
        Future.delayed(Duration(milliseconds: 1500), () {
          Navigator.of(context).pushReplacementNamed('/home');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, // Ocupa toda a largura da tela
        padding: const EdgeInsets.all(0), // Margem do container dentro do body
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.PrimariaBase,
              Colors.black,
            ],
          ),
        ),
        child: Center( // Centraliza o conteúdo verticalmente e horizontalmente
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente os widgets dentro da coluna
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente os widgets dentro da coluna
            children: [
              Container(
                height: 200, // Defina a altura desejada do GIF
                child: Image.asset(
                  'assets/images/estrelaanimadaa.gif', // Verifique se o GIF está na pasta correta
                  fit: BoxFit.contain, // Ajusta a imagem para caber no container
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre o GIF e o texto
              Text(
                displayedText, // Texto que aparece letra por letra
                textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
