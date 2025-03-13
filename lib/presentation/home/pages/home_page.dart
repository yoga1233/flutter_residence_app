import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_residence_app/presentation/home/bloc/news/news_bloc.dart';
import 'package:flutter_residence_app/presentation/home/widget/home_icon.dart';
import 'package:flutter_residence_app/presentation/home/widget/news_card.dart';
import 'package:flutter_residence_app/presentation/home/widget/news_card_shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<NewsBloc>().add(NewsEvent.getNews());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("HomePage didChangeDependencies dipanggil");
  }

  @override
  bool get wantKeepAlive => false; // Set false agar tidak di-cache

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  BlocConsumer<NewsBloc, NewsState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        failed: (error) => context.showErrorSnackbar(error),
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => SizedBox(),
                        loading:
                            () => SizedBox(
                              height: 350,
                              child: ListView.builder(
                                // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (context, index) => NewsCardShimmer(),
                                itemCount: 5,
                              ),
                            ),
                        success:
                            (data) => SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...data.response!.map(
                                    (e) => NewsCard(
                                      label: e.title!,
                                      createAt: e.createdAt!.toIso8601String(),
                                      desc: e.content!,
                                      imgUrl: e.imageUrl!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
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
