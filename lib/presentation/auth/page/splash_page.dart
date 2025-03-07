import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/constant/colors.dart';
import 'package:flutter_residence_app/core/extensions/build_context_ext.dart';
import 'package:flutter_residence_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_residence_app/presentation/auth/page/login_page.dart';
import 'package:flutter_residence_app/presentation/home/pages/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      await AuthLocalDatasource().getAuthData();
      if (context.mounted) {
        if (AuthLocalDatasource.userData == null) {
          context.pushReplacement(LoginPage());
        } else {
          context.pushReplacement(MainPage());
        }
      }
    });
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
