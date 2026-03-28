import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../data/user_mock_store.dart';
import '../model/user_model.dart';

class LoginViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;
  String? errorMessage;

  final UserMockStore _store = UserMockStore();

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<UserModel?> login() async {
    if (!formKey.currentState!.validate()) return null;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));

    final user = _store.findByEmailAndPassword(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (user == null) {
      errorMessage = 'Email ou senha inválidos.';
    }

    isLoading = false;
    notifyListeners();

    return user;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
