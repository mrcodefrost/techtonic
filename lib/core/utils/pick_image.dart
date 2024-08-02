import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    // quality can be between 0 - 100 (to handle compression)
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}
