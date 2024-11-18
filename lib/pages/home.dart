import 'package:flutter/material.dart';
import 'package:terceiroprojeto/pages/pesquisa.dart';
import 'package:terceiroprojeto/pages/videoscreen.dart';
import 'package:url_launcher/url_launcher.dart'; // Import para abrir links no navegador.
import 'home.dart';
import 'cadastro.dart';
import 'login.dart';
import 'package:terceiroprojeto/shared/style.dart';

class Homepage extends StatelessWidget {
  Homepage ({super.key});

  final List<Map<String, String>> playlists = [
    {'image': 'assets/images/furia(album).jpg', 'name': 'Fúria'},
    {'image': 'assets/images/musicascurtidas.png', 'name': 'Músicas curtidas'},
    {'image': 'assets/images/flomili.jpg', 'name': 'Flo Mili'},
    {'image': 'assets/images/aju(ep).png', 'name': 'AJU'},
    {'image': 'assets/images/caju(album).jpg', 'name': 'Caju'},
    {'image': 'assets/images/vistagrossa(album).jpg', 'name': 'Vista Grossa'},
  ];

  final List<Map<String, String>> artistas = [
    {'image': 'assets/images/flomili.jpg', 'name': 'FLO MILI'},
    {'image': 'assets/images/urias.jpeg', 'name': 'URIAS'},
    {'image': 'assets/images/slipmami.jpg', 'name': 'SLIPMANI'},
    {'image': 'assets/images/ajuliacosta.jpg', 'name': 'AJULIACOSTA'},
    {'image': 'assets/images/liniker.jpeg', 'name': 'LINIKER'},
    {'image': 'assets/images/monnabrutal.jpeg', 'name': 'MONNA BRUTAL'},
  ];

  final List<Map<String, String>> descubra = [
    {'image': 'assets/images/anitta.webp', 'name': 'ANITTA'},
    {'image': 'assets/images/ludmilla.webp', 'name': 'LUDMILLA'},
    {'image': 'assets/images/slayyyter.png', 'name': 'SLAYYYTER'},
    {'image': 'assets/images/pabllovittar.jpg', 'name': 'PABLLO VITTAR'},
    {'image': 'assets/images/gloriagroover.webp', 'name': 'GLORIA GROOVER'},
    {'image': 'assets/images/mcsoffia.png', 'name': 'MC SOFFIA'},
  ];

  // URL do vídeo do clipe "Tanto Faz - Urias".
  void _launchVideo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoScreen(
          videoUrl: 'https://youtu.be/-H4UKen_ErE?si=EW3Z3OE6pjw78wqX',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [MyColors.PrimariaBase, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),// Título e espaçamento superior
              Center(
                child: Text(
                  "SYMPHONIE",
                  style: TextStyle(
                    fontFamily: 'lexendGiga',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),

              // GridView para exibir as playlists
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 250,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 3,
                    ),
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      final playlist = playlists[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 41, 41, 41),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.asset(
                                playlist['image']!,
                                width: 60,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                playlist['name']!,
                                style: const TextStyle(
                                  fontFamily: 'LexendGiga',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Container com o clipe da semana
                GestureDetector(
                  onTap: () => _launchVideo(context),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Stack(
                      children: [
                        // Imagem de fundo
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/tantofazclipe.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        
                        // Container para o texto sobreposto
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "CLIPE DA SEMANA",
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "TANTO FAZ - URIAS",
                                  style: TextStyle(
                                    fontFamily: 'Lexendgiga',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              const SizedBox(height: 20),

              // seus artistas estao com saudade
               // Seção com a frase "Seus artistas estão com saudade"
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'SEUS ARTISTAS ESTÃO COM SAUDADE',  // A frase que será exibida
                      style: const TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Seção de artistas com rolagem horizontal
                Padding(
                    padding: const EdgeInsets.all(10.0),
                  //padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,  // Define a rolagem para horizontal
                      itemCount: artistas.length,
                      itemBuilder: (context, index) {
                        final artista = artistas[index];
                        return Container(
                          width: 120,  // Largura fixa para cada item
                          margin: const EdgeInsets.only(right: 7),  // Espaçamento entre os itens
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os itens
                            children: [
                              // Imagem do artista centralizada
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  artista['image']!,
                                  width: 100,  // Ajuste o tamanho da imagem
                                  height: 100, // Ajuste o tamanho da imagem
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8), // Espaço entre a imagem e o nome do artista
                              // Nome do artista abaixo da imagem
                              Text(
                                artista['name']!,
                                style: const TextStyle(
                                  fontFamily: 'LexendGiga',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                                  softWrap: false, // Impede a quebra de linha
                                  overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 10),

               // Seção com a frase "Descubra em 2024"  
               Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                     child: Text(
                       'DESCUBRA EM 2024',  // A frase que será exibida
                       style: const TextStyle(
                         fontFamily: 'Lexend',
                         fontSize: 17,
                         fontWeight: FontWeight.w700,
                         color: Colors.white,
                       ),
                     ),
                   ),
                 ],
               ),
                const SizedBox(height: 10),

               Padding(
                    padding: const EdgeInsets.all(10.0),
                  //padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,  // Define a rolagem para horizontal
                      itemCount: descubra.length,
                      itemBuilder: (context, index) {
                        final veja = descubra[index];
                        return Container(
                          width: 120,  // Largura fixa para cada item
                          margin: const EdgeInsets.only(right: 7),  // Espaçamento entre os itens
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os itens
                            children: [
                              // Imagem do artista centralizada
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  veja['image']!,
                                  width: 100,  // Ajuste o tamanho da imagem
                                  height: 100, // Ajuste o tamanho da imagem
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8), // Espaço entre a imagem e o nome do artista
                              // Nome do artista abaixo da imagem
                              Text(
                                veja['name']!,
                                style: const TextStyle(
                                  fontFamily: 'LexendGiga',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                                  softWrap: false, // Impede a quebra de linha
                                  overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
      
      // Barra de navegação inferior
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
}

