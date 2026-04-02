import 'package:flutter/material.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _entrar() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final senha = _senhaController.text;

      final usuario = CadastroScreen.usuariosCadastrados.firstWhere(
        (u) => u['email'] == email && u['senha'] == senha,
        orElse: () => {},
      );

      if (usuario.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email ou senha incorretos.'),
            backgroundColor: Color(0xFFCC0000),
          ),
        );
        return;
      }

      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: usuario['nome'],
      );
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
                  'BEMVINDO',
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
                  'Acesse sua conta para ver os livros',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 48),
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
                      return 'Informe o email';
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
                    hintText: 'Sua senha',
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
                      return 'Informe sua senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _entrar,
                  child: const Text('ENTRAR'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Nao tem uma conta? ',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/cadastro');
                      },
                      child: const Text(
                        'Cadastrar',
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