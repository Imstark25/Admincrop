// certificate_verification_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CertificateVerificationView extends StatelessWidget {
  const CertificateVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Certificate Verification',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logic for farmer verification
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Farmer Verification'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logic for importer verification
                  },
                  icon: const Icon(Icons.local_shipping),
                  label: const Text('Importer Verification'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildContractTemplate(),
        ],
      ),
    );
  }

  Widget _buildContractTemplate() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Verification & Supply Contract',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Divider(height: 30, color: Colors.grey),
            _buildContractSection(
              title: 'Parties to the Agreement',
              content:
              'This agreement is made and entered into on [Date] between [Farmer\'s/Importer\'s Name] (hereinafter referred to as the "Supplier") and the [Platform\'s Name] (hereinafter referred to as the "Platform").',
            ),
            _buildContractSection(
              title: 'Certification',
              content:
              'The Supplier warrants that all products supplied under this contract are of the quality specified in the attached certification documents. These products are certified by [Certification Authority] under certificate number [Certificate ID]. The Platform reserves the right to audit and verify this certification at any time.',
            ),
            _buildContractSection(
              title: 'Terms of Supply',
              content:
              'The Supplier agrees to provide products as per the terms agreed upon in the separate order agreement. The Platform will handle all payments to the Supplier based on successful delivery and verification of product quality.',
            ),
            _buildContractSection(
              title: 'Confidentiality',
              content:
              'Both parties agree to keep all business, financial, and product information confidential and shall not disclose it to any third party without prior written consent.',
            ),
            const SizedBox(height: 30),
            _buildSignatureSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildContractSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignatureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Signatures',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSignatureLine('Supplier'),
            _buildSignatureLine('Platform'),
          ],
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Action to perform on contract verification
              Get.snackbar(
                'Verification Confirmed',
                'Contract has been successfully verified.',
                backgroundColor: Colors.green.shade100,
                colorText: Colors.green.shade800,
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text('Verify & Confirm'),
          ),
        ),
      ],
    );
  }

  Widget _buildSignatureLine(String role) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(height: 5),
        Text(role, style: const TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }
}