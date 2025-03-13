import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core.dart';

class CImagePicker extends StatefulWidget {
  final Function(File?) onImagePicked;

  const CImagePicker({super.key, required this.onImagePicked});

  @override
  State<CImagePicker> createState() => _CImagePickerState();
}

class _CImagePickerState extends State<CImagePicker> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 20,
    );
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      widget.onImagePicked(_image);
    }
  }

  //showmodal botom choose image from camera or gallery
  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
    widget.onImagePicked(null);
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth =
                  constraints.maxWidth * 0.7; // Maksimal 70% dari layar
              double maxHeight =
                  constraints.maxHeight * 0.7; // Maksimal 70% dari layar

              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.file(
                        _image!,
                        width: maxWidth,
                        height: maxHeight * 0.7,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.navInActive),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap:
            _image == null
                ? () => _showPicker(context)
                : () => _showImageDialog(context),
        child:
            _image == null
                ? Center(
                  child: Icon(Icons.add_a_photo, color: AppColors.navInActive),
                )
                : Stack(
                  children: [
                    Image.file(
                      _image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: _removeImage,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
