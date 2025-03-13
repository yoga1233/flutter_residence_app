import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.primary : AppColors.navInActive,
                BlendMode.srcIn,
              ),
            ),
          ),
          4.height,
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primary : AppColors.navInActive,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
