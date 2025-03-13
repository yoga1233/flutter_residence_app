import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/core/service/navigation_service.dart';
import 'package:flutter_residence_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_residence_app/data/datasource/news_remote_datasource.dart';
import 'package:flutter_residence_app/data/datasource/report_remote_datasource.dart';
import 'package:flutter_residence_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_residence_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_residence_app/presentation/auth/page/splash_page.dart';
import 'package:flutter_residence_app/presentation/home/bloc/news/news_bloc.dart';
import 'package:flutter_residence_app/presentation/home/bloc/report/report_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(AuthRemoteDatasource())),
        BlocProvider(create: (context) => RegisterBloc(AuthRemoteDatasource())),
        BlocProvider(create: (context) => NewsBloc(NewsRemoteDatasource())),
        BlocProvider(create: (context) => ReportBloc(ReportRemoteDatasource())),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Poppins",

          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.primary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2.0,
              ), // Ubah warna di sini
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.navInActive, width: 1.0),
            ),
          ),
        ),
        home: SplashPage(),
      ),
    );
  }
}
