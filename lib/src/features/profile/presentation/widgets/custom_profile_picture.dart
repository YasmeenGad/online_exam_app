import 'dart:io';
import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import '../../../../core/constants/assets.dart';
import 'image_picker_sheet.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;

  void _setImage(File? image) {
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          _image == null
              ? CircleAvatar(
                  backgroundImage:
                      AssetImage(Assets.imageProfile) as ImageProvider,
                )
              : CircleAvatar(
                  backgroundImage: FileImage(_image!) as ImageProvider),
          Positioned(
            right: -12,
            bottom: 10,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: AppColors.whiteColor),
                  ),
                  backgroundColor:
                      Colors.lightBlue, // Replace with AppColors.lightBlue
                ),
                onPressed: () {
                  showImagePickerSheet(context, _setImage);
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.whiteColor,
                  // Replace with AppColors.blueBaseColor
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
