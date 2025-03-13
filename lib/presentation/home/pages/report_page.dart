import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_residence_app/core/core.dart';
import 'package:flutter_residence_app/data/model/request/report_request_model.dart';

import '../bloc/report/report_bloc.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

File? _image;
TextEditingController cTitle = TextEditingController(text: '');
TextEditingController cDesc = TextEditingController(text: '');

final formKey = GlobalKey<FormState>();

class _ReportPageState extends State<ReportPage> {
  @override
  void dispose() {
    cTitle.dispose();
    cDesc.dispose();
    _image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.backround,
        appBar: AppBar(
          backgroundColor: AppColors.backround,
          // foregroundColor: AppColors.accent,
          surfaceTintColor: AppColors.backround,

          leading: InkWell(
            onTap: () => context.pop(),
            child: Icon(Icons.arrow_back_ios_new, color: AppColors.navInActive),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Size.horiontalPadding,
                  vertical: Size.verticalPadding,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 30.height,
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
                      Field.text(
                        controller: cTitle,
                        label: 'Title',
                        hint: 'Add title',
                        validator: (value) {
                          if (value == '') {
                            return "Title cannot be empty";
                          }
                          return null;
                        },
                      ),
                      20.height,
                      Field.text(
                        controller: cDesc,
                        label: 'Description',
                        hint: 'Add description',
                        validator: (value) {
                          if (value == '') {
                            return "Desciption cannot be empty";
                          } else if (value!.length <= 10) {
                            return "Description must be at least 10 characters";
                          }
                          return null;
                        },
                        maxline: 5,
                      ),
                      20.height,
                      CImagePicker(
                        onImagePicked: (e) {
                          setState(() {
                            _image = e;
                          });
                        },
                      ),
                      30.height,
                      BlocConsumer<ReportBloc, ReportState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            failed: (error) => context.showErrorSnackbar(error),
                            success: () {
                              context.pop();
                              context.showSuccessSnackbar(
                                'Success submit report',
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse:
                                () => Button.filled(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      ReportRequestModel data =
                                          ReportRequestModel(
                                            title: cTitle.text,
                                            description: cDesc.text,
                                            image: _image,
                                          );
                                      context.read<ReportBloc>().add(
                                        ReportEvent.sendReport(data),
                                      );
                                    }
                                  },
                                  label: 'Submit',
                                  borderRadius: 8,
                                ),
                            loading:
                                () =>
                                    Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
