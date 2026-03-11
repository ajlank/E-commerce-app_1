import 'package:fashionapp/features/auth/domain/entities/register.dart';
import 'package:fashionapp/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:fashionapp/features/auth/presentation/widgets/auth_footer_link.dart';
import 'package:fashionapp/features/auth/presentation/widgets/auth_header.dart';
import 'package:fashionapp/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:fashionapp/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    context.pop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AuthHeader(
            title: 'Easy Fashion',
            subtitle: "Hi, Welcome back. You've been missed",
          ),
          AuthTextField(
            controller: _username,
            hintText: 'username',
            icon: Icons.person,
          ),
          AuthTextField(
            controller: _email,
            hintText: 'email',
            icon: Icons.mail,
          ),
          AuthTextField(
            controller: _password,
            hintText: 'password',
            icon: Icons.lock,
            obscureText: true,
          ),
          AuthPrimaryButton(
            label: 'SIGN UP',
            onPressed: () {
              final model = Register(
                email: _email.text,
                username: _username.text,
                password: _password.text,
              );
              context.read<AuthNotifier>().registerFunc(model, context);
              context.go('/login');
            },
          ),
          AuthFooterLink(
            text: 'Already registered? login here',
            onTap: () {
              context.go('/login');
            },
          ),
        ],
      ),
    );
  }
}
