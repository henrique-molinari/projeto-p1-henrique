import 'package:flutter/material.dart';
import 'package:projeto/features/auth/viewmodel/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashViewmodel viewModel = SplashViewmodel();

  @override
  void initState() {
    super.initState();
    viewModel.navigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Icon(
              Icons.sentiment_satisfied_alt,
              size: 100,
              color: Colors.yellow,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Henrique Molinari',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
