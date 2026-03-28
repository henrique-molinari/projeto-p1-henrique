# Flutter Auth App

Trabalho desenvolvido por **Henrique de Oliveira Molinari** — RA: 25001176
Optei por realizar o trabalho individualmente.

---

## Arquitetura

O projeto segue o padrão **MVVM (Model - View - ViewModel)**, organizado por features:

- **Model** — representa os dados do usuário (`UserModel`)
- **View** — telas da aplicação, responsáveis apenas pela interface
- **ViewModel** — contém toda a lógica de negócio, separada da UI, utilizando `ChangeNotifier` + `AnimatedBuilder`
- **Data** — classe `UserMockStore` no padrão Singleton, responsável por manter a lista de usuários em memória durante a execução do app

---

## O que foi implementado

- **Splash Screen** — primeira tela exibida, com ícone centralizado e meu nome. Navega automaticamente para o Login após 3 segundos
- **Login** — formulário com validação de email e senha via pacote `validatorless`. Autentica o usuário consultando a lista mockada em memória. Exibe mensagem de erro caso o login seja inválido
- **Cadastro** — formulário com validação de nome, email, senha e confirmação de senha. Adiciona o novo usuário à lista mockada. Verifica duplicidade de email e exibe snackbar de sucesso ou erro
- **Home** — tela exibida após login ou cadastro bem-sucedido, com ícone de casa e texto centralizados e botão de logout
- **Dados mockados** — armazenamento apenas em memória usando `List<UserModel>`, sem banco de dados ou API externa

---

## Usuário padrão

| Campo | Valor |
|---|---|
| Email | henriquemolinari@gmail.com |
| Senha | 123456 |

---

## Rotas

| Rota | Tela |
|---|---|
| `/` | SplashPage |
| `/login` | LoginPage |
| `/register` | RegisterPage |
| `/home` | HomePage |

---

## Estrutura de pastas

```
lib/
├── main.dart
├── app/
│   ├── app_widget.dart
│   └── routes/
│       ├── app_pages.dart
│       └── app_routes.dart
└── features/
    └── auth/
        ├── data/
        │   └── user_mock_store.dart
        ├── model/
        │   └── user_model.dart
        ├── view/
        │   ├── splash_page.dart
        │   ├── login_page.dart
        │   ├── register_page.dart
        │   └── home_page.dart
        └── viewmodel/
            ├── splash_viewmodel.dart
            ├── login_viewmodel.dart
            └── register_viewmodel.dart
```

---

## Como executar

No terminal, utilize esses dois códigos:

```
flutter pub get
flutter run
```

