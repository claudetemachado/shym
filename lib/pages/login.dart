import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter
import 'package:terceiroprojeto/shared/style.dart'; // Importa um arquivo de estilos personalizado

// Define o widget de Login como StatefulWidget, para que ele tenha estado mutável
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário, usada na validação
  bool _showPassword = false; // Variável para alternar a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20), // Adiciona espaço superior ao título
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Deixa o texto em negrito
              fontSize: 24, // Define o tamanho da fonte
              color: Colors.white, // Cor do texto
            ),
          ),
        ),
        backgroundColor: MyColors.PrimariaBase, // Define a cor de fundo da AppBar
        centerTitle: true, // Centraliza o título
        toolbarHeight: 100, // Define a altura da AppBar
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Define a altura do Container
        padding: const EdgeInsets.all(16), // Define o padding interno
        decoration: const BoxDecoration(
          gradient: LinearGradient( // Aplica um gradiente ao fundo
            begin: Alignment.topCenter, // Início do gradiente
            end: Alignment.bottomCenter, // Fim do gradiente
            colors: [
              MyColors.PrimariaBase, // Cor inicial do gradiente
              Colors.black, // Cor final do gradiente
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Associa a chave de formulário
            autovalidateMode: AutovalidateMode.onUserInteraction, // Valida ao interagir com o campo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Campo de entrada de email
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Padding interno
                  margin: const EdgeInsets.only(bottom: 8), // Margem inferior
                  width: 300, // Largura do campo
                  height: 60, // Altura do campo
                  decoration: BoxDecoration(
                    color: Colors.white, // Cor de fundo do campo
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Cor da sombra
                        blurRadius: 5, // Intensidade do desfoque
                        offset: const Offset(0, 2), // Posição da sombra
                      ),
                    ],
                  ),
                  child: TextFormField(
                    autofocus: true, // Ativa o foco automático
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail), // Ícone de email
                      iconColor: MyColors.SecundariaBase, // Cor do ícone
                      hintText: "Informe o seu email", // Texto de dica
                      border: InputBorder.none, // Remove a borda padrão
                      contentPadding: const EdgeInsets.only(top: 5), // Padding interno
                    ),
                    validator: (String? email) { // Valida o campo de email
                      if (email == null || email.isEmpty) {
                        return "O email não pode ser vazio";
                      }
                      if (email.length < 6) {
                        return "O email está muito curto";
                      }
                      if (!email.contains("@")) {
                        return "O email é inválido";
                      }
                      return null;
                    },
                  ),
                ),

                // Campo de entrada de senha
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Padding interno
                  margin: const EdgeInsets.only(bottom: 20), // Margem inferior
                  width: 300, // Largura do campo
                  height: 50, // Altura do campo
                  decoration: BoxDecoration(
                    color: Colors.white, // Cor de fundo do campo
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Cor da sombra
                        blurRadius: 5, // Intensidade do desfoque
                        offset: const Offset(0, 2), // Posição da sombra
                      ),
                    ],
                  ),
                  child: TextFormField(
                    obscureText: !_showPassword, // Alterna a visibilidade da senha
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock), // Ícone de cadeado
                      suffixIcon: GestureDetector(
                        child: Icon(_showPassword
                            ? Icons.visibility
                            : Icons.visibility_off), // Alterna o ícone de visibilidade
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword; // Altera a visibilidade da senha
                          });
                        },
                      ),
                      iconColor: MyColors.SecundariaBase, // Cor do ícone
                      hintText: "Digite sua senha", // Texto de dica
                      border: InputBorder.none, // Remove a borda padrão
                    ),
                  ),
                ),

                // Botão "Entrar" que navega para a página Home
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) { // Verifica se o formulário está válido
                      Navigator.pushNamed(context, '/Home'); // Navega para a tela 'Home'
                    }
                  },
                  child: const Text("Entrar"), // Texto do botão
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16), // Padding do botão
                    minimumSize: const Size(200, 50), // Tamanho mínimo do botão
                    backgroundColor: MyColors.SecundariaBase, // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordas arredondadas do botão
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Espaço entre o botão "Entrar" e o link "Cadastrar-se"

                // Link "Cadastrar-se" que navega para a página de Cadastro
                GestureDetector(
                  child: const Center(
                    child: Text(
                      "Cadastrar-se",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, // Negrito
                          fontSize: 15, // Tamanho da fonte
                          color: Colors.white), // Cor do texto
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Cadastro'); // Navega para a tela 'Cadastro'
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
