import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Cadastro'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(height: 30),
               Icon(Icons.person_add_outlined, size: 80),
               SizedBox(height: 20),
               Text(
                'Criar conta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 8),
               Text(
                'Preencha os dados abaixo',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
               SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
               SizedBox(height: 16),
               TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
               SizedBox(height: 16),
               TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outlined),
                ),
              ),
               SizedBox(height: 16),
               TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outlined),
                ),
              ),
               SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child:  Text('Cadastrar'),
                ),
              ),
               SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Já tem conta?'),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:  Text('Fazer login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
