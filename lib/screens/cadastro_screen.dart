import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  static final List<Map<String, String>> usuariosCadastrados = [
    {
      'nome': 'Otavio',
      'email': 'otavio@gmail.com',
      'senha': '123456',
    },
  ];

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();

      final emailJaExiste = CadastroScreen.usuariosCadastrados
          .any((u) => u['email'] == email);

      if (emailJaExiste) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Este email ja esta cadastrado.'),
            backgroundColor: Color(0xFFCC0000),
          ),
        );
        return;
      }

      CadastroScreen.usuariosCadastrados.add({
        'nome': _nomeController.text.trim(),
        'email': email,
        'senha': _senhaController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Color(0xFF1A5C1A),
        ),
      );

      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Container(
                  width: 48,
                  height: 4,
                  color: const Color(0xFFCC0000),
                ),
                const SizedBox(height: 24),
                const Text(
                  'CRIAR\nCONTA',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.1,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'É aqui que fica o registramento das pessoas',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'NOME',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF888888),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nomeController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Seu nome',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }
                    if (value.trim().length < 2) {
                      return 'Nome muito curto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'EMAIL',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF888888),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'seu@email.com',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Email invalido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'SENHA',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF888888),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _senhaController,
                  obscureText: !_senhaVisivel,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Minimo 6 caracter',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _senhaVisivel
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF666666),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _senhaVisivel = !_senhaVisivel;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe uma senha';
                    }
                    if (value.length < 6) {
                      return 'A senha deve ter no minimo 6 caracter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text('CADASTRAR'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ja possui uma conta? ',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}