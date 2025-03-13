// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ReportRequestModel {
  String title;
  String description;
  File? image;
  ReportRequestModel({
    required this.title,
    required this.description,
    this.image,
  });
}
