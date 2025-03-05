import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/component/button.dart';
import 'package:flutter_residence_app/core/component/field.dart';
import 'package:flutter_residence_app/core/constant/colors.dart';
import 'package:flutter_residence_app/core/extensions/extensions.dart';
import 'package:flutter_residence_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_residence_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_residence_app/presentation/home/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passController = TextEditingController(text: '');
    final formKey = GlobalKey<FormState>(); //
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Stack(
        children: [
          Container(
            height: context.deviceHeight * 0.4,
            width: context.deviceWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.backround],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Form(
                key: formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    100.height,
                    Text(
                      'Hey, There\nfind your residence service here!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    8.height,
                    Text(
                      'Enter your email address and password to use the apps',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subtittle,
                      ),
                    ),
                    50.height,
                    Field.email(controller: emailController),
                    20.height,
                    Field.password(controller: passController),
                    30.height,
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (data) async {
                            await AuthLocalDatasource().saveAuthData(data);
                            if (context.mounted) {
                              context.pushReplacement(MainPage());
                            }
                          },
                          failed: (error) => context.showErrorSnackbar(error),
                          loading: () => FocusScope.of(context).unfocus(),
                          orElse: () {},
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading:
                              () => Center(child: CircularProgressIndicator()),
                          orElse:
                              () => Button.filled(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(
                                      LoginEvent.login(
                                        email: emailController.text,
                                        password: passController.text,
                                      ),
                                    );
                                  }
                                },
                                label: 'Login',
                                borderRadius: 8,
                              ),
                        );
                      },
                    ),
                    Spacer(),
                    //text dont have an account
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Register',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to desired screen
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
