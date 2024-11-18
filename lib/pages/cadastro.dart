import 'package:flutter/material.dart'; // Importa o pacote de material design do Flutter
import 'package:terceiroprojeto/pages/home.dart'; // Importa a página de Home
import 'package:terceiroprojeto/shared/style.dart'; // Importa estilos personalizados do projeto

// Define uma classe StatefulWidget chamada Cadastro
class Cadastro extends StatefulWidget {
  const Cadastro({super.key}); // Construtor que permite chaves de identificador

  @override
  State<Cadastro> createState() => _CadastroState(); // Cria o estado para o widget Cadastro
}

// Classe que gerencia o estado do widget Cadastro
class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>(); // Cria uma chave global para o formulário
  bool _showPassword = false; // Controla a visibilidade da senha
  String? _usuario, _email, _senha, _confirmarSenha; // Variáveis para armazenar dados do formulário

  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface do widget
    return Scaffold(
      // Cria a estrutura básica da tela
      appBar: AppBar(
        // Cria a barra de aplicativo na parte superior
        title: const Padding(
          // Adiciona um espaçamento ao título
          padding: EdgeInsets.only(top: 20), // Define o padding superior
          child: Text(
            // Define o texto do título
            "CADASTRO", // Texto do título
            style: TextStyle(
              // Estilo do texto
              fontWeight: FontWeight.bold, // Define o peso da fonte como negrito
              fontSize: 24, // Tamanho da fonte
              color: Colors.white, // Cor do texto
            ),
          ),
        ),
        backgroundColor: MyColors.PrimariaBase, // Cor de fundo da AppBar
        centerTitle: true, // Centraliza o título na AppBar
        toolbarHeight: 100, // Define a altura da AppBar          
      ),                                                    // ta faltando amor paterno e materno p essa porra
      body: Container(
        // Contêiner que envolve o corpo da tela
        decoration: BoxDecoration(
          // Define a decoração do Container
          gradient: const LinearGradient(
            // Aplica um gradiente como fundo
            begin: Alignment.topCenter, // Início do gradiente na parte superior
            end: Alignment.bottomCenter, // Fim do gradiente na parte inferior
            colors: [
              MyColors.PrimariaBase, // Cor inicial do gradiente
              Colors.black, // Cor final do gradiente
            ],
          ),
        ),
        child: SingleChildScrollView(
          // Permite que o conteúdo role se necessário
          child: Container(
            padding: const EdgeInsets.all(16), // Ajuste do padding interno do Container
            child: Form(
              // Cria um formulário
              key: _formKey, // Associa a chave global ao formulário
              autovalidateMode: AutovalidateMode.onUserInteraction, // Valida automaticamente ao interagir
              child: Column(
                // Cria uma coluna para organizar os widgets verticalmente
                crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os filhos horizontalmente
                children: [
                  // Campo de nome de usuário
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome de Usuário",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Cor de fundo do campo
                      filled: true, // Habilita a cor de fundo
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "O nome de usuário não pode ser vazio";
                      }
                      return null; // Retorna nulo se não houver erro
                    },
                    onChanged: (value) {
                      _usuario = value; // Armazena o valor do campo
                    },
                  ),
                  const SizedBox(height: 16), // Espaçamento entre os campos

                  // Campo de email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Cor de fundo do campo
                      filled: true, // Habilita a cor de fundo
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "O email não pode ser vazio";
                      }
                      if (!value.contains("@")) {
                        return "O email é inválido";
                      }
                      return null; // Retorna nulo se não houver erro
                    },
                    onChanged: (value) {
                      _email = value; // Armazena o valor do campo
                    },
                  ),
                  const SizedBox(height: 16), // Espaçamento entre os campos

                  // Campo de senha
                  TextFormField(
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword; // Alterna a visibilidade da senha
                          });
                        },
                      ),
                      fillColor: Colors.white, // Cor de fundo do campo
                      filled: true, // Habilita a cor de fundo
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "A senha não pode ser vazia";
                      }
                      if (value.length < 6) {
                        return "A senha deve ter pelo menos 6 caracteres";
                      }
                      return null; // Retorna nulo se não houver erro
                    },
                    onChanged: (value) {
                      _senha = value; // Armazena o valor do campo
                    },
                  ),
                  const SizedBox(height: 16), // Espaçamento entre os campos

                  // Campo de confirmação de senha
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirmar Senha",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Cor de fundo do campo
                      filled: true, // Habilita a cor de fundo
                    ),
                    validator: (value) {
                      if (value != _senha) {
                        return "As senhas não coincidem"; // Mensagem de erro se as senhas não coincidem
                      }
                      return null; // Retorna nulo se não houver erro
                    },
                    onChanged: (value) {
                      _confirmarSenha = value; // Armazena o valor do campo
                    },
                  ),
                  const SizedBox(height: 24), // Espaçamento antes do botão

                  // Botão de cadastro
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Verifica se o formulário é válido
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()), // Navega para a página Home
                        );
                      }
                    },
                    child: const Text("Entrar"), // Texto do botão
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Padding do botão
                      backgroundColor: MyColors.SecundariaBase, // Cor de fundo do botão
                      foregroundColor: Colors.white, // Cor do texto do botão
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
