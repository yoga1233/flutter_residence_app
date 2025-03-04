import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';

class HomeIcon extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;
  const HomeIcon({
    super.key,
    required this.label,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(iconPath, width: 24, color: AppColors.primary),
          ),
        ),
        6.height,
        Text(label, style: TextStyle(color: AppColors.primary)),
      ],
    );
  }
}
