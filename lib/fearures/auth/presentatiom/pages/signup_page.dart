import 'package:blog_app/fearures/auth/presentatiom/pages/signin_page.dart';
import 'package:blog_app/fearures/auth/presentatiom/widgets/auth_field.dart';
import 'package:blog_app/fearures/auth/presentatiom/widgets/sign_button.dart';
import 'package:blog_app/fearures/auth/presentatiom/widgets/sign_floating_text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const SignUpPage());

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SignUpForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            usernameController: usernameController,
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AuthField(hintText: 'Username', controller: usernameController),
            SizedBox(height: 12),
            AuthField(hintText: 'Email', controller: emailController),
            SizedBox(height: 12),
            AuthField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: 12),
            SignButton(text: 'Sign Up'),
            SizedBox(height: 14),
            SignFloatingText(
              messageText: 'Already have an Account?',
              clickableText: 'Sign In',
              recognizer: () {
                Navigator.of(context).push(SignInPage.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
