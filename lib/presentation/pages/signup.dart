import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/presentation/pages/root.dart';
import 'package:spotify_clone/presentation/pages/signin.dart';
import 'package:spotify_clone/presentation/widget/big_button.dart';
import 'package:spotify_clone/presentation/widget/custom_appbar.dart';
import 'package:spotify_clone/presentation/widget/line_decoration.dart';
import 'package:spotify_clone/presentation/widget/other_method_login.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigator(context),
      appBar: CustomAppbar(logo: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              _supportText(context),
              SizedBox(height: 20),
              _formFullName(context),
              SizedBox(height: 20),
              _formEmail(context),
              SizedBox(height: 20),
              _formPassword(context),
              SizedBox(height: 20),
              BigButton(
                onPressed: () async {
                  var result = await sl<SignupUseCase>().call(
                    params: CreateUser(
                      fullname: _fullname.text.toString(),
                      email: _email.text.toString(),
                      password: _email.text.toString(),
                    ),
                  );
                  result.fold(
                    (ifLeft) {
                      var snackbar = SnackBar(content: Text(ifLeft));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (ifRight) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RootPage()),
                        (route) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('account succesfully registed')),
                      );
                    },
                  );
                },
                text: 'Create Account',
                height: 70,
              ),
              LineDecoration(),
              OtherMethodLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      'Register',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget _supportText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'If You Need Any Support',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Click here',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _formFullName(BuildContext context) {
    return TextField(
      controller: _fullname,
      decoration: InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _formEmail(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _formPassword(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget bottomNavigator(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do You Have an Account?',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SigninPage()),
                ),
            child: Text(
              'Sign in',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
