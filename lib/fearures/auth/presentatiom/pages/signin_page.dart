import 'package:blog_app/fearures/auth/presentatiom/pages/signup_page.dart';
import 'package:blog_app/fearures/auth/presentatiom/widgets/auth_field.dart';
import 'package:blog_app/fearures/auth/presentatiom/widgets/sign_button.dart';
import 'package:blog_app/fearures/auth/presentatiom/widgets/sign_floating_text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const SignInPage());

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SignInForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
          ),
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AuthField(hintText: 'Email', controller: emailController),
            SizedBox(height: 12),
            AuthField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: 12),
            SignButton(text: 'Let\'s Go'),
            SizedBox(height: 14),
            SignFloatingText(
              messageText: 'Don\'t have an Account?',
              clickableText: 'Sign Up',
              recognizer: () {
                Navigator.of(context).push(SignUpPage.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
