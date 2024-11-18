import 'package:flutter/material.dart';
import 'package:terceiroprojeto/pages/pesquisa.dart';
import 'package:terceiroprojeto/shared/style.dart';
import 'package:terceiroprojeto/pages/login.dart';
import 'package:terceiroprojeto/pages/cadastro.dart';
import 'package:terceiroprojeto/pages/home.dart';
import 'package:terceiroprojeto/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(
            seedColor: MyColors.SecundariaBase), // Corrigido para ColorScheme
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        // '/login': (context) => const Login(),
        // '/Cadastro' : (context) => const Cadastro(),     
        //'/pesquisa': (context) => const Pesquisa(),
      },
    );
  }
}
