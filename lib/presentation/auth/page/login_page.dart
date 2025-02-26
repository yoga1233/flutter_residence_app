import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/component/button.dart';
import 'package:flutter_residence_app/core/component/field.dart';
import 'package:flutter_residence_app/core/constant/colors.dart';
import 'package:flutter_residence_app/core/extensions/num_ext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Field.email(label: 'Masukan Email'),
            16.height,
            Field.password(label: 'Masukan Password'),
            16.height,
            Button.filled(onPressed: () {}, label: 'Login'),
          ],
        ),
      ),
    );
  }
}
