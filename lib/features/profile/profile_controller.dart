import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  List<String> listGender = ['Male', 'Female', 'Others'];
  TextEditingController genderController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  DateTime dateSelected = DateTime.now();
  final ImagePicker _picker = ImagePicker();
  var pathPicked = File('').obs;

  selectGender(String gender) {
    genderController.text = gender;
  }

  onLibrary() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pathPicked.value = File(pickedFile.path);
    }
  }
}
