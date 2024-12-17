import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../shared/theme.dart';

class CustomImagePicker extends StatefulWidget {
  final String title;
  final EdgeInsets margin;

  const CustomImagePicker({
    super.key,
    required this.title,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }

    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }

    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = pickedFile;
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
          ),
          SizedBox(height: 6),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: _image == null
                      ? Center(
                          child: Text(
                            'Pilih Gambar',
                            style: greyTextStyle,
                          ),
                        )
                      : Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
