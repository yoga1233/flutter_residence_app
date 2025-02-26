import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/component/button.dart';
import 'package:flutter_residence_app/core/constant/colors.dart';
import 'package:flutter_residence_app/core/extensions/num_ext.dart';
import 'package:flutter_residence_app/presentation/auth/page/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            50.height,
            Button.filled(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
