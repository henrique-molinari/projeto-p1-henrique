import 'package:flutter/material.dart';
import 'package:projeto/app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Sair',
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print('Nota do professor Marcelo: Nossa Henrique, que projeto perfeito! Você acaba de ganhar 7 pontos :)');
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Icon(
                  Icons.home_rounded,
                  size: 90,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Bem-vindo(a) à Home!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Você está autenticado com sucesso.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.deepPurple, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Login realizado com sucesso',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}