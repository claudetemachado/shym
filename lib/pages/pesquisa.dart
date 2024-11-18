import 'package:flutter/material.dart';
import 'package:terceiroprojeto/shared/style.dart';

void main() {
  runApp(const Pesquisa());
}

class Pesquisa extends StatelessWidget {
  const Pesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Aplicando o gradiente de fundo
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.PrimariaBase,
              Colors.black
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60), // Espaçamento extra para descer a barra de pesquisa

                // Campo de Pesquisa
                                  // Campo de Pesquisa com imagem de perfil
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        // Imagem de perfil circular
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('assets/images/perfil.png'), // Caminho da imagem de perfil
                          ),
                        ),
                        
                        // Campo de texto
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'O que você quer ouvir?',
                              hintStyle: const TextStyle(color: Colors.black38),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                const SizedBox(height: 32), // Ajustado para dar mais espaçamento

                // Seção Brasileiras
                buildSectionTitle('BRASILEIRAS'),
                buildHorizontalList([
                  buildCard('FÚRIA - URIAS',
                      'assets/images/furia(album).jpg', Icons.music_note),
                  buildCard('CAJU - LINIKER',
                      'assets/images/caju(album).jpg', Icons.music_note),
                  buildCard('MENINA MÁ - ANITTA',
                      'assets/images/meninama.jpg', Icons.music_note),
                  buildCard('LOUCA DE SAUDADE - JORGE E MATEUS',
                      'assets/images/loucadesaudade.jpg', Icons.music_note),
                ]),
                const SizedBox(height: 24),

                // Seção Podcasts
                buildSectionTitle('PODCASTS'),
                buildHorizontalList([
                  buildCard('PEEWEECAST',
                      'assets/images/peweecast.jpg', Icons.headphones),
                  buildCard('CAFÉ COM CRIME',
                      'assets/images/cafecomcrime.jpg', Icons.headphones),
                  buildCard('INTELIGÊNCIA LIMITADA',
                      'assets/images/ltda.jpg', Icons.headphones),
                  buildCard('PODPAH',
                      'assets/images/podpah.jpg', Icons.headphones),
                ]),
                const SizedBox(height: 24),

                // Seção Lançamentos
                buildSectionTitle('LANÇAMENTOS'),
                buildHorizontalList([
                  buildCard('AJU - AJULIACOSTA',
                      'assets/images/aju(ep).png', Icons.music_note),
                  buildCard('BELLAKEO - ANITTA FEAT. PESO PLUMA',
                      'assets/images/bellakeo.jpg', Icons.music_note),
                   buildCard('NOSSO PRIMIEOR BEIJO - GLORIA GROOVE',
                      'assets/images/primeirobeijo.jpg', Icons.music_note),
                   buildCard('MAGNATA - URIAS',
                      'assets/images/magnata.jpg', Icons.music_note),
                ]),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Início",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Pesquisa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: "Biblioteca",
              ),
            ],
            selectedItemColor: MyColors.PrimariaBase,
            unselectedItemColor: Colors.white,
            currentIndex: 0,
            onTap: (index) {
              // Adicionando a navegação para a tela de pesquisa
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pesquisa()),
                );
              }
            },
          )
    );
  }

  // titulo da seção
Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20, // Aumentar o tamanho da fonte
        fontWeight: FontWeight.bold,
        fontFamily: 'Lexend', // Certifique-se de que a fonte 'Lexend' está disponível
        letterSpacing: 1.0, // Adicionar espaçamento entre letras
      ),
    ),
  );
}

  //  lista horizontal albuns
  Widget buildHorizontalList(List<Widget> cards) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
  
  //albuns
  Widget buildCard(String title, String imageUrl, IconData icon) {
  return Container(
    margin: const EdgeInsets.only(right: 16.0),
    width: 160,
    height: 200, 
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adicionado padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white70, // Cor do ícone
                size: 16, // Tamanho do ícone
              ),
              const SizedBox(width: 8), // Espaço entre ícone e o título
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'LexendGiga',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


}
