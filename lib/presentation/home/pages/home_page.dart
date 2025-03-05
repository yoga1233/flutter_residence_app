import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_residence_app/presentation/home/widget/home_icon.dart';
import 'package:flutter_residence_app/presentation/home/widget/news_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.backround,
                            ),
                          ),
                          Text(
                            AuthLocalDatasource.userData!.response!.username!
                                .toUpperCase(),
                            style: TextStyle(
                              color: AppColors.backround,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        Assets.icons.notification.path,
                        colorFilter: ColorFilter.mode(
                          AppColors.backround,
                          BlendMode.srcIn,
                        ),
                      ),
                      // Icon(Icons.notifications, color: AppColors.backround),
                    ],
                  ),
                  50.height,
                  Container(
                    height: 50,
                    width: context.deviceWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: AppColors.navInActive),
                          10.width,
                          Text(
                            'Search service here',
                            style: TextStyle(color: AppColors.navInActive),
                          ),
                        ],
                      ),
                    ),
                  ),
                  70.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeIcon(
                        label: 'House',
                        onTap: () {},
                        iconPath: Assets.icons.house.path,
                      ),
                      HomeIcon(
                        label: 'Electricity',
                        onTap: () {},
                        iconPath: Assets.icons.electric.path,
                      ),
                      HomeIcon(
                        label: 'Cleaner',
                        onTap: () {},
                        iconPath: Assets.icons.clean.path,
                      ),
                      HomeIcon(
                        label: 'Plumber',
                        onTap: () {},
                        iconPath: Assets.icons.plumbing.path,
                      ),
                      HomeIcon(
                        label: 'More',
                        onTap: () {},
                        iconPath: Assets.icons.more.path,
                      ),
                    ],
                  ),
                  50.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today news',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(color: AppColors.secondary),
                      ),
                    ],
                  ),
                  20.height,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NewsCard(
                          label: 'Pohon Tumbang',
                          createAt: '22 des 2024',
                          desc:
                              'Pohon tumbang menghantam sebuah mobil di jalan kembangsari',
                          imgUrl:
                              'https://awsimages.detik.net.id/community/media/visual/2021/12/23/pohon-tumbang-timpa-mobil-di-tangerang-akibat-hujan-disertai-angin-kencang_169.jpeg?w=1200',
                        ),
                        NewsCard(
                          label: 'Pohon Tumbang',
                          createAt: '22 des 2024',
                          desc:
                              'Pohon tumbang menghantam sebuah mobil di jalan kembangsari',
                          imgUrl:
                              'https://awsimages.detik.net.id/community/media/visual/2021/12/23/pohon-tumbang-timpa-mobil-di-tangerang-akibat-hujan-disertai-angin-kencang_169.jpeg?w=1200',
                        ),
                        NewsCard(
                          label: 'Pohon Tumbang',
                          createAt: '22 des 2024',
                          desc:
                              'Pohon tumbang menghantam sebuah mobil di jalan kembangsari',
                          imgUrl:
                              'https://awsimages.detik.net.id/community/media/visual/2021/12/23/pohon-tumbang-timpa-mobil-di-tangerang-akibat-hujan-disertai-angin-kencang_169.jpeg?w=1200',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
