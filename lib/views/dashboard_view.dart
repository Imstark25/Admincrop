// lib/views/dashboard_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindashboard/controllers/dashboard_controller.dart';
import 'package:admindashboard/views/dashboard_content_view.dart';
import 'package:admindashboard/views/crop_management_view.dart';
import 'package:admindashboard/views/farmer_management_view.dart';
import 'package:admindashboard/views/importer_management_view.dart';
import 'package:admindashboard/views/store_management_view.dart';
import 'package:admindashboard/views/orders_view.dart';
import 'package:admindashboard/views/support_view.dart';
import 'package:admindashboard/views/settings/settings_view.dart';
import 'package:admindashboard/views/certificate_verification_view.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  final DashboardController controller = Get.put(DashboardController());

  // 'const' HAS BEEN REMOVED from the list literal because its widgets aren't constant
  final List<Widget> pages = [
    const DashboardContentView(),
    const CropManagementView(),
    const FarmerManagementView(),
    const ImporterManagementView(),
    const StoreManagementView(),
    const OrdersView(),
    const CertificateVerificationView(),
    const SupportView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      drawer: _buildLeftDrawer(context),
      endDrawer: const EndDrawer(),
      body: Obx(() => pages[controller.selectedIndex.value]),
    );
  }

  Widget _buildLeftDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green.shade800),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.green, size: 40),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text('Welcome, Admin', style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('admin@example.com', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          _buildDrawerItem(0, Icons.dashboard, 'Dashboard'),
          _buildDrawerItem(1, Icons.grass, 'Crop Management'),
          _buildDrawerItem(2, Icons.person, 'Farmer Management'),
          _buildDrawerItem(3, Icons.local_shipping, 'Importer Management'),
          _buildDrawerItem(4, Icons.store, 'Store Management'),
          _buildDrawerItem(5, Icons.list_alt, 'Orders'),
          _buildDrawerItem(6, Icons.verified_user, 'Certificate Verification'),
          _buildDrawerItem(7, Icons.support_agent, 'Support'),
          _buildDrawerItem(8, Icons.settings, 'Settings'),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              Get.snackbar('Signed Out', 'You have been signed out.');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, IconData icon, String title) {
    return Obx(() {
      final isSelected = controller.selectedIndex.value == index;
      return ListTile(
        leading: Icon(icon, color: isSelected ? Colors.green.shade800 : Colors.black54),
        title: Text(title, style: TextStyle(color: isSelected ? Colors.green.shade800 : Colors.black87)),
        selected: isSelected,
        onTap: () {
          controller.changePage(index);
          Get.back();
        },
      );
    });
  }
}