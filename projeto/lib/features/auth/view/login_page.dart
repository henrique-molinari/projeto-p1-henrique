import 'package:flutter/material.dart';
import 'package:projeto/app/routes/app_routes.dart';
import 'package:projeto/features/auth/viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewmodel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    final user = await viewModel.login();
    if (user != null && mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.home, arguments: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          appBar: AppBar(title:  Text('Login'), centerTitle: true),
          body: SafeArea(
            child: SingleChildScrollView(
              padding:  EdgeInsets.all(16),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     SizedBox(height: 30),
                     Icon(Icons.lock_outline, size: 80),
                     SizedBox(height: 20),
                     Text(
                      'Bem-vindo',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(height: 8),
                     Text(
                      'Faça login para continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    ),
                     SizedBox(height: 32),
                    TextFormField(
                      controller: viewModel.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: viewModel.emailValidator,
                      decoration:  InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                     SizedBox(height: 16),
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.obscurePassword,
                      validator: viewModel.passwordValidator,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border:  OutlineInputBorder(),
                        prefixIcon:  Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          onPressed: viewModel.togglePasswordVisibility,
                          icon: Icon(
                            viewModel.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    if (viewModel.errorMessage != null) ...[
                       SizedBox(height: 12),
                      Container(
                        padding:  EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                             Icon(Icons.error_outline, color: Colors.red),
                             SizedBox(width: 8),
                            Text(
                              viewModel.errorMessage!,
                              style:  TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                     SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: viewModel.isLoading ? null : _handleLogin,
                        child: viewModel.isLoading
                            ?  SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            :  Text('Entrar'),
                      ),
                    ),
                     SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text('Não tem conta?'),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.register),
                          child:  Text('Cadastre-se'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}