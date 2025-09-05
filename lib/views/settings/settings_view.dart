// lib/views/settings/settings_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindashboard/controllers/settings_controller.dart';
import 'package:admindashboard/views/settings/update_profile_view.dart';
import 'package:admindashboard/views/settings/general_view.dart';
import 'package:admindashboard/views/settings/app_info_view.dart';
import 'package:admindashboard/views/settings/push_notifications_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  final SettingsController controller = Get.put(SettingsController());

  final Map<String, Widget> settingsPages = const {
    'General': GeneralView(),
    'Update Profile': UpdateProfileView(),
    'App Info': AppInfoView(),
    'Push Notifications': PushNotificationsView(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSettingsSidebar(),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Obx(
                          () => settingsPages[controller.selectedSettingsItem.value]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSidebar() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _buildSettingsItem(Icons.settings_outlined, 'General'),
          _buildSettingsItem(Icons.person_outline, 'Update Profile'),
          _buildSettingsItem(Icons.info_outline, 'App Info'),
          _buildSettingsItem(Icons.notifications_outlined, 'Push Notifications'),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return Obx(() {
      final isSelected = controller.selectedSettingsItem.value == title;
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.black54,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.black54,
            ),
          ),
          onTap: () {
            controller.changeSettingsItem(title);
          },
        ),
      );
    });
  }
}