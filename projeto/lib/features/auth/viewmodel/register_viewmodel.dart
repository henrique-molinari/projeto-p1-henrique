import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:projeto/features/auth/data/user_mock_store.dart';
import 'package:projeto/features/auth/model/user_model.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;
  String? errorMessage;

  final UserMockStore _store = UserMockStore();

  String? nameValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Nome é obrigatório'),
      Validatorless.min(3, 'Nome deve ter pelo menos 3 caracteres'),
    ])(value);
  }

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

  String? confirmPasswordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Confirmação é obrigatória'),
      Validatorless.compare(passwordController, 'As senhas não coincidem'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) return false;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 800));

    if (_store.emailExists(emailController.text.trim())) {
      errorMessage = 'Este email já está cadastrado.';
      isLoading = false;
      notifyListeners();
      return false;
    }

    _store.add(UserModel(
      nome: nameController.text.trim(),
      email: emailController.text.trim(),
      senha: passwordController.text.trim(),
    ));

    isLoading = false;
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
