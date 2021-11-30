import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snapmap/models/user.dart';
import 'package:snapmap/widgets/atoms/avatar.dart';
import 'package:snapmap/services/photo_service.dart' as photo_service;

class AvatarPicker extends StatefulWidget {
  const AvatarPicker(this.user, {this.callback, Key? key}) : super(key: key);
  final User user;
  final void Function(String)? callback;
  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  late User user = widget.user;
  Uint8List? selectedImageBytes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: imgFromGallery,
      child: Avatar(
        widget.user.profileUrl,
        overrideBytes: selectedImageBytes,
      ),
    );
  }

  imgFromGallery() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    if (file == null) return;
    Uint8List image = await file.readAsBytes();
    setState(() {
      selectedImageBytes = image;
    });
    String imageUrl =
        await photo_service.uploadProfileImage(user.username, image);
    if (widget.callback != null) {
      widget.callback!(imageUrl);
    }
  }
}