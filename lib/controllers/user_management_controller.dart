// lib/controllers/user_management_controller.dart

import 'package:get/get.dart';
import 'package:admindashboard/user_data.dart';

class UserManagementController extends GetxController {
  RxList<User> farmerList = <User>[].obs;
  RxList<User> importerList = <User>[].obs;
  RxList<User> filteredFarmerList = <User>[].obs;
  RxList<User> filteredImporterList = <User>[].obs;

  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    farmerList.assignAll(sampleFarmers);
    importerList.assignAll(sampleImporters);
    filteredFarmerList.assignAll(farmerList);
    filteredImporterList.assignAll(importerList);

    debounce(searchQuery, (String query) {
      _filterUsers(query);
    }, time: const Duration(milliseconds: 300));
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void _filterUsers(String query) {
    if (query.isEmpty) {
      filteredFarmerList.assignAll(farmerList);
      filteredImporterList.assignAll(importerList);
    } else {
      filteredFarmerList.assignAll(
        farmerList.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
      filteredImporterList.assignAll(
        importerList.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}