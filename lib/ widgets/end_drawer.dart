// lib/widgets/end_drawer.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindashboard/controllers/dashboard_controller.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  _EndDrawerState createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  bool _isHovering = false;

  late final DashboardController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DashboardController>();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: Container(
        width: _isHovering ? 250 : 70,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            _buildDrawerHeader(),
            const Divider(color: Colors.grey),
            _buildDrawerItem(
              icon: Icons.dashboard,
              label: 'Overview',
              onTap: () {
                controller.changePage(0);
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.people,
              label: 'User Management',
              onTap: () {
                controller.changePage(2);
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.eco,
              label: 'Crop Listings',
              onTap: () {
                controller.changePage(1);
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.payments,
              label: 'Payments & Escrow',
              onTap: () {
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.assignment_turned_in,
              label: 'Orders & Contracts',
              onTap: () {
                controller.changePage(5);
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.gavel,
              label: 'Dispute Management',
              onTap: () {
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.analytics,
              label: 'Analytics & Reports',
              onTap: () {
                Get.back();
              },
            ),
            _buildDrawerItem(
              icon: Icons.notifications,
              label: 'Notifications',
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: AnimatedCrossFade(
        firstChild: const Icon(
          Icons.agriculture,
          size: 40,
          color: Colors.green,
        ),
        secondChild: Row(
          children: [
            const Icon(
              Icons.agriculture,
              size: 40,
              color: Colors.green,
            ),
            const SizedBox(width: 10),
            Text(
              'CropsureConnect',
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        crossFadeState: _isHovering ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green.shade800),
      title: _isHovering
          ? Text(
        label,
        style: const TextStyle(color: Colors.black87),
      )
          : null,
      onTap: onTap,
    );
  }
}