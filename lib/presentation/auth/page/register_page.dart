import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_residence_app/presentation/auth/page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController cUsername = TextEditingController(text: '');
  final TextEditingController cEmail = TextEditingController(text: '');
  final TextEditingController cPassword = TextEditingController(text: '');
  final TextEditingController cReEnterPass = TextEditingController(text: '');

  String? _validateReEnterPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value != cPassword.text) {
      return 'Password different';
    }

    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter username';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Scaffold(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      100.height,
                      Text(
                        'Hey, There\nregister your account here!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      8.height,
                      Text(
                        'Enter your data to register the apps',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtittle,
                        ),
                      ),
                      50.height,
                      Field.text(
                        controller: cUsername,
                        label: 'Username',
                        validator: _validateUsername,
                      ),
                      20.height,
                      Field.email(controller: cEmail, label: 'Email Address'),
                      20.height,
                      Field.password(controller: cPassword),
                      20.height,
                      Field.password(
                        controller: cReEnterPass,
                        label: 'Re enter Password',
                        validator: _validateReEnterPassword,
                      ),
                      30.height,
                      BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            success: () {
                              context
                                ..showSuccessSnackbar('Register Success')
                                ..pop();
                            },
                            failed:
                                (error) => context.showErrorSnackbar(
                                  'failed to register',
                                ),
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading:
                                () =>
                                    Center(child: CircularProgressIndicator()),
                            orElse:
                                () => Button.filled(
                                  onPressed: () {
                                    context.read<RegisterBloc>().add(
                                      RegisterEvent.register(
                                        username: cUsername.text,
                                        email: cEmail.text,
                                        password: cReEnterPass.text,
                                      ),
                                    );
                                  },
                                  label: 'Register',
                                  borderRadius: 8,
                                ),
                          );
                        },
                      ),

                      20.height, //text dont have an account
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Login',
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 18,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushReplacement(LoginPage());
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
      ),
    );
  }
}
