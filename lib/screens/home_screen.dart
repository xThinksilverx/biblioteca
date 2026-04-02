import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> _livrosOtavio = [
    {
      'titulo': 'Contos de Horror da Mimi',
      'autor': 'Junji Ito',
    },
    {
      'titulo': 'Eu, Robo',
      'autor': 'Isaac Asimov',
    },
    {
      'titulo': 'Androides Sonham com Ovelhas Eletricas?',
      'autor': 'Philip K. Dick',
    },
    {
      'titulo': 'Meridiano de Sangue',
      'autor': 'Cormac McCarthy',
    },
    {
      'titulo': 'I Have No Mouth, and I Must Scream',
      'autor': 'Harlan Ellison',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String nomeUsuario =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'Leitor';

    final bool ehOtavio = nomeUsuario.toLowerCase() == 'otavio';
    final List<Map<String, String>> livros =
        ehOtavio ? _livrosOtavio : [];

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(28, 40, 28, 32),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF1A1A1A),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 4,
                      color: const Color(0xFFCC0000),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'OLA,\n${nomeUsuario.toUpperCase()}.',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'SEeu historico de leitura',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF666666),
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 16),
                child: Row(
                  children: [
                    const Text(
                      'ULTIMOS LIVROS LIDOS',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF888888),
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCC0000),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        '${livros.length}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: livros.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF2A2A2A),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.menu_book_outlined,
                                color: Color(0xFF333333),
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Nenhum livro registrado',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        itemCount: livros.length,
                        itemBuilder: (context, index) {
                          final livro = livros[index];
                          return _LivroCard(
                            numero: index + 1,
                            titulo: livro['titulo']!,
                            autor: livro['autor']!,
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF555555),
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  child: const Text(
                    'SAIR DA CONTA',
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LivroCard extends StatelessWidget {
  final int numero;
  final String titulo;
  final String autor;

  const _LivroCard({
    required this.numero,
    required this.titulo,
    required this.autor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        border: Border.all(
          color: const Color(0xFF1E1E1E),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF1A0000),
              border: Border.all(
                color: const Color(0xFF3A0000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              '$numero',
              style: const TextStyle(
                color: Color(0xFFCC0000),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  autor,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12,
                    letterSpacing: 0.3,
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