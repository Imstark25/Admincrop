// lib/user_data.dart

import 'package:flutter/material.dart';

class User {
  final String userId;
  final String name;
  final String email;
  final String phone;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
  });
}

// Sample data for Farmer Management
final List<User> sampleFarmers = [
  User(
    userId: 'hf5mTnHrCjYROr7nFq4Ka53jxOEl',
    name: 'Pradeep',
    email: 'pradeep@gmail.com',
    phone: '9944555799',
  ),
  User(
    userId: 'ITgEbDhbcfWfbLqn3zfrUIqzaHv2',
    name: 'Aji sir',
    email: 'ajisir@gmail.com',
    phone: '9248965865',
  ),
  User(
    userId: 'cooQmPELErBWBQVyGpy111J3fD13',
    name: 'pradeep',
    email: 'pradeepmuthiu@gmail.com',
    phone: '6385861120',
  ),
  User(
    userId: 'Zdal916Vs9XNR8I8tBvcCBTj1yW2',
    name: 'srini',
    email: 'srini@fb101@gmail.com',
    phone: '6383134299',
  ),
  User(
    userId: 'S7KmKSKvJbb3whJKhSO6E14LWb22',
    name: 'Srini',
    email: 'srini.offi@gmail.com',
    phone: '6383134299',
  ),
];

// Sample data for Importer Management
final List<User> sampleImporters = [
  User(
    userId: 'importer_user_id_1',
    name: 'John Smith',
    email: 'john.smith@importer.com',
    phone: '9876543210',
  ),
  User(
    userId: 'importer_user_id_2',
    name: 'Jane Doe',
    email: 'jane.doe@importer.com',
    phone: '9876543211',
  ),
  User(
    userId: 'importer_user_id_3',
    name: 'Peter Jones',
    email: 'peter.jones@importer.com',
    phone: '9876543212',
  ),
];