import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/presentation/home/pages/history_page.dart';
import 'package:flutter_residence_app/presentation/home/pages/home_page.dart';
import 'package:flutter_residence_app/presentation/home/pages/report_page.dart';
import 'package:flutter_residence_app/presentation/home/pages/setting_page.dart';
import 'package:flutter_residence_app/presentation/home/pages/status_page.dart';
import 'package:flutter_residence_app/presentation/home/widget/nav_item.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    StatusPage(),
    HistoryPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround,

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backround,
        shape: const CircleBorder(),
        onPressed: () {
          context.push(const ReportPage());
        },
        child: SvgPicture.asset(
          Assets.icons.nav.add.path,
          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                iconPath: Assets.icons.nav.home.path,
                label: 'Home',
                isActive: _selectedIndex == 0,
                onTap: () => setState(() => _selectedIndex = 0),
              ),
              NavItem(
                iconPath: Assets.icons.nav.task.path,
                label: 'Status',
                isActive: _selectedIndex == 1,
                onTap: () => setState(() => _selectedIndex = 1),
              ),
              const SizedBox(width: 40), // Beri jarak untuk FAB
              NavItem(
                iconPath: Assets.icons.nav.browser.path,
                label: 'History',
                isActive: _selectedIndex == 2,
                onTap: () => setState(() => _selectedIndex = 2),
              ),
              NavItem(
                iconPath: Assets.icons.nav.settings.path,
                label: 'Setting',
                isActive: _selectedIndex == 3,
                onTap: () => setState(() => _selectedIndex = 3),
              ),
            ],
          ),
        ),
      ),

      // Menggunakan IndexedStack agar state setiap halaman tetap terjaga
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }
}
