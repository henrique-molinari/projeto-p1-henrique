import 'package:projeto/features/auth/model/user_model.dart';

class UserMockStore {
  static final UserMockStore _instance = UserMockStore._internal();

  factory UserMockStore() => _instance;

  UserMockStore._internal();

  final List<UserModel> _users = [
    UserModel(nome: 'Admin', email: 'admin@email.com', senha: '123456'),
  ];

  List<UserModel> get users => _users;

  void add(UserModel user) {
    _users.add(user);
  }

  UserModel? findByEmailAndPassword(String email, String senha) {
    try {
      return _users.firstWhere(
        (u) => u.email == email && u.senha == senha,
      );
    } catch (_) {
      return null;
    }
  }

  bool emailExists(String email) {
    return _users.any((u) => u.email == email);
  }
}
