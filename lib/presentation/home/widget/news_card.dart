import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';

class NewsCard extends StatelessWidget {
  final String label;
  final String createAt;
  final String desc;
  final String imgUrl;
  const NewsCard({
    super.key,
    required this.label,
    required this.createAt,
    required this.desc,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: 350,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CachedNetworkImage(imageUrl: imgUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
                6.height,
                Text(
                  createAt,
                  style: TextStyle(
                    color: AppColors.subtittle,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                6.height,
                Text(desc, style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
