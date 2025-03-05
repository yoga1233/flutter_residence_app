import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_residence_app/presentation/auth/page/login_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void showLogoutDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Logout"),
            content: Text("Are you sure want to logout?"),
            actions: [
              // Tombol Batal
              TextButton(
                onPressed: () {
                  context.pop(); // Tutup dialog
                },
                child: Text("No"),
              ),
              // Tombol Logout
              TextButton(
                onPressed: () async {
                  context.pop(); // Tutup dialog
                  AuthLocalDatasource().removeAuthData();
                  context.pushReplacement(LoginPage()); // Panggil fungsi logout
                },
                child: Text("Logout", style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      // appBar: AppBar(title: const Text('Setting')),
      backgroundColor: AppColors.backround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              6.width,
              const Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              20.height,
              Text('Account', style: TextStyle(color: Colors.grey)),
              6.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text('Email'),
                      trailing: Text(
                        AuthLocalDatasource.userData!.response!.email!,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Username'),
                      trailing: Text(
                        AuthLocalDatasource.userData!.response!.username!,
                      ),
                    ),
                  ],
                ),
              ),
              10.height,
              Text('Login', style: TextStyle(color: Colors.grey)),
              6.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text('Logout'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () => showLogoutDialog(context),
                    ),
                    // Divider(),
                    // ListTile(
                    //   leading: Icon(Icons.person),
                    //   title: Text('Username'),
                    //   trailing: Text(
                    //     AuthLocalDatasource.userData!.response!.username!,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
