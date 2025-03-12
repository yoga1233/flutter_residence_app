import 'package:flutter/material.dart';
import 'package:flutter_residence_app/core/core.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.backround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Size.horiontalPadding,
              vertical: Size.verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.navInActive,
                  ),
                ),
                30.height,
                Text(
                  'Create Report',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                6.height,
                Text(
                  'The Add Report page allows users to submit reports about issues or incidents in their residential area. Users can enter a report title, provide a detailed description, and optionally upload an image as supporting evidence.',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                20.height,
                Field.text(label: 'Title', hint: 'Add title'),
                20.height,
                Field.text(
                  label: 'Description',
                  hint: 'Add description',
                  maxline: 5,
                ),
                30.height,
                Button.filled(
                  onPressed: () {},
                  label: 'Submit',
                  borderRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
