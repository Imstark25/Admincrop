// lib/views/importer_management_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindashboard/controllers/user_management_controller.dart';
import 'package:admindashboard/user_data.dart';

class ImporterManagementView extends StatelessWidget {
   ImporterManagementView({super.key});

  final UserManagementController controller = Get.put(UserManagementController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Importer Management',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStatCards(),
            const SizedBox(height: 30),
            _buildActionSection(),
            const SizedBox(height: 20),
            Obx(() => _buildDataTable(controller.filteredImporterList)),
            const SizedBox(height: 20),
            _buildPagination(),
          ],
        ),
      ),
    );
  }

  // ... (All helper methods are the same as in the farmer view, just for importers)
  Widget _buildStatCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('Total Importers', '25', Colors.blue, Icons.people),
        _buildStatCard('Active Importers', '20', Colors.green, Icons.person_add_alt_1),
        _buildStatCard('Blocked Importers', '1', Colors.red, Icons.person_remove),
        _buildStatCard('Deleted Importers', '4', Colors.orange, Icons.person_off),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color iconColor, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: iconColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search importers...',
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) => controller.updateSearchQuery(value),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {
            Get.snackbar('Add New Importer', 'Button pressed!');
          },
          icon: const Icon(Icons.person_add),
          label: const Text('Add New Importer'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable(List<User> users) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Photo')),
            DataColumn(label: Text('User ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Phone')),
          ],
          rows: users.map((user) {
            return DataRow(cells: [
              DataCell(
                CircleAvatar(
                  child: Text(user.name.substring(0, 1)),
                ),
              ),
              DataCell(Text(user.userId)),
              DataCell(Text(user.name)),
              DataCell(Text(user.email)),
              DataCell(Text(user.phone)),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        _buildPageButton('1', isSelected: true),
        _buildPageButton('2'),
        _buildPageButton('3'),
        const Text('...'),
        _buildPageButton('5'),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildPageButton(String page, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade600 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        page,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}