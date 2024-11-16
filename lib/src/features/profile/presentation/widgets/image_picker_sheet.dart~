import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showImagePickerSheet(BuildContext context, Function(File?) onImagePicked) {
  final ImagePicker _picker = ImagePicker();

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext bc) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    '${AppLocalizations.of(context)!.chooseAnOption}!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.blue),
                // Replace with AppColors.blueBaseColor
                title: Text('${AppLocalizations.of(context)!.gallery}'),
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    onImagePicked(File(pickedFile.path));
                  }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.blue),
                // Replace with AppColors.blueBaseColor
                title: Text('${AppLocalizations.of(context)!.camera}'),
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    onImagePicked(File(pickedFile.path));
                  }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.redAccent),
                title: Text('${AppLocalizations.of(context)!.removePicture}',
                    style: TextStyle(color: Colors.redAccent)),
                onTap: () {
                  onImagePicked(null);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
