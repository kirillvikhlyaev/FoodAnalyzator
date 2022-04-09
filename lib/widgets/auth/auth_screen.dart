import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          title: const Text(
            'Sign In',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: AuthForm(),
          ),
        ),
        backgroundColor: AppColors.bgColor);
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _loginController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');
  String? errorMessage;

  void auth() {
    final login = _loginController.text;
    final pass = _passwordController.text;

    if (login.isEmpty || pass.isEmpty) {
      errorMessage = 'Fill in the fields';
    } else if (login == "admin" && pass == "admin") {
      errorMessage = null;
      Navigator.pushReplacementNamed(context, '/main_screen');
    } else {
      errorMessage = 'User name or password incorrect!';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorMessage = this.errorMessage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorMessage != null) ...[
          Container(
            child: Text(
              errorMessage,
              style: const TextStyle(fontSize: 16, color: AppColors.errorColor),
            ),
            padding: const EdgeInsets.only(bottom: 25),
          )
        ],
        TextField(
          decoration: InputDecoration(
            labelText: 'User name',
            labelStyle: const TextStyle(color: AppColors.secondColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(width: 0, color: AppColors.secondColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(width: 0, color: AppColors.secondColor)),
          ),
          controller: _loginController,
        ),
        const SizedBox(height: 25),
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(color: AppColors.secondColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(width: 0, color: AppColors.secondColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(width: 0, color: AppColors.secondColor)),
          ),
          obscureText: true,
          controller: _passwordController,
        ),
        const SizedBox(height: 25),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot your password?',
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15)),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.mainColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
              onPressed: auth,
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        const Divider(
          height: 2,
          color: Color(0xFFE1E4E9),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('New user?',
                style: TextStyle(
                    color: AppColors.secondDarkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/auth/create_an_account'),
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          ],
        )
      ],
    );
  }
}
