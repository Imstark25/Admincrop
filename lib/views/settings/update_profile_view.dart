// lib/views/settings/update_profile_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindashboard/controllers/settings_controller.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Update Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton.icon(
                    onPressed: controller.toggleEditing,
                    icon: Icon(controller.isEditing.value ? Icons.save : Icons.edit),
                    label: Text(controller.isEditing.value ? 'Save' : 'Edit'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange,
                  ),
                  child: const Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                title: 'Full Name',
                hintText: 'Moni',
                icon: Icons.person_outline,
                isEditable: controller.isEditing.value,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                title: 'Email Address',
                hintText: 'moni@gmail.com',
                icon: Icons.email_outlined,
                isEditable: false,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                title: 'Phone Number',
                hintText: '1234567890',
                icon: Icons.phone_outlined,
                isEditable: controller.isEditing.value,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                title: 'Role',
                hintText: 'Admin',
                icon: Icons.person_pin_outlined,
                isEditable: false,
                description: 'Role is fixed as Admin',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                title: 'User ID',
                hintText: '3QBeqoJlmkUSXILInh6P1AWTZV13',
                icon: Icons.fingerprint,
                isEditable: false,
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String title,
    required String hintText,
    required IconData icon,
    bool isEditable = true,
    String? description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: hintText,
          enabled: isEditable,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green.shade600),
            ),
            filled: true,
            fillColor: isEditable ? Colors.white : Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
          style: TextStyle(
            color: isEditable ? Colors.black : Colors.grey.shade600,
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ],
    );
  }
}