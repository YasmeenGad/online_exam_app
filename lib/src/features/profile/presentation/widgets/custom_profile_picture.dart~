import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/dependency injection/di.dart';
import '../cubit/profile_actions.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';
import 'image_picker_sheet.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;
  late final profileViewModel;

  initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    profileViewModel.doAction(GetCachedProfileImage());
  }

  void _setImage(File? image) {
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) => profileViewModel,
      child: BlocListener<ProfileViewModel, ProfileState>(
        listener: (context, state) {
          if (state is CachedProfileImageLoadedState) {
            _setImage(state.imageFile);
          }
        },
        child: SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              _image == null
                  ? CircleAvatar(
                      backgroundImage: AssetImage(Assets.imageProfileImage),
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
                      backgroundColor: Colors.lightBlue,
                    ),
                    onPressed: () {
                      showImagePickerSheet(context, (File? image) {
                        if (image != null) {
                          profileViewModel
                              .doAction(CacheProfileImage(imageFile: image));
                          _setImage(image);
                          setState(() {}); // Cache the image path
                        } else {
                          _setImage(null);
                          setState(() {}); // Remove the image if null is passed
                        }
                      });
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.whiteColor,
                      size: 22,
                    ),
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
