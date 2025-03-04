import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          30.height,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Hallo'), Text('Yoga Pamungkas')],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
