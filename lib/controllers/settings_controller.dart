// lib/controllers/settings_controller.dart

import 'package:get/get.dart';

class SettingsController extends GetxController {
  var selectedSettingsItem = 'Update Profile'.obs;
  var isEditing = false.obs;

  void changeSettingsItem(String item) {
    selectedSettingsItem.value = item;
  }

  void toggleEditing() {
    isEditing.toggle();
  }
}