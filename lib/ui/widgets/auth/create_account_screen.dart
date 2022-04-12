import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/navigation/main_navigation.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          title: const Text(
            'Create an account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: CreateAccountForm(),
          ),
        ),
        backgroundColor: AppColors.bgColor);
  }
}

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  String? errorMessage;

  bool validCheckAndCheck() {
    if (usernameController.text == '' || usernameController.text.length < 5) {
      errorMessage = 'User name is too small';
      return false;
    }
    if (passwordController.text == '' || passwordController.text.length < 5) {
      errorMessage = 'Password is too small';
      return false;
    }
    if (passwordController.text != repeatPasswordController.text) {
      errorMessage = "Passwords don't match";
      return false;
    } else {
      errorMessage = null;
      return true;
    }
    setState(() {});
  }

  void OnCreateClick() {
    if (validCheckAndCheck()) {
      Navigator.pushReplacementNamed(
          context, MainNavigationRouteNames.mainScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final errorMessage = this.errorMessage;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (errorMessage != null) ...[
        Container(
          child: Text(
            errorMessage,
            style: const TextStyle(fontSize: 16, color: AppColors.errorColor),
          ),
          padding: const EdgeInsets.only(bottom: 25),
        )
      ],
      RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: 'Create an account',
            style: TextStyle(
                fontSize: 20,
                color: AppColors.secondDarkColor,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: ' and you will be able to use our',
            style: TextStyle(fontSize: 20, color: AppColors.secondDarkColor)),
        TextSpan(
            text: ' rich library',
            style: TextStyle(
                fontSize: 20,
                color: AppColors.secondDarkColor,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: ', also',
            style: TextStyle(fontSize: 20, color: AppColors.secondDarkColor)),
        TextSpan(
            text: ' calculate calories',
            style: TextStyle(
                fontSize: 20,
                color: AppColors.secondDarkColor,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: ' and',
            style: TextStyle(fontSize: 20, color: AppColors.secondDarkColor)),
        TextSpan(
            text: ' watch the history',
            style: TextStyle(
                fontSize: 20,
                color: AppColors.secondDarkColor,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: ' of your calculations',
            style: TextStyle(fontSize: 20, color: AppColors.secondDarkColor)),
      ])),
      const SizedBox(height: 25),
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
        controller: usernameController,
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
        controller: passwordController,
      ),
      const SizedBox(height: 25),
      TextField(
        decoration: InputDecoration(
          labelText: 'Repeat password',
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
        controller: repeatPasswordController,
      ),
      const SizedBox(height: 25),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15)),
                backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)))),
            onPressed: OnCreateClick,
            child: const Text(
              'Create',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      )
    ]);
  }
}
