// lib/routes/app_routes.dart

import 'package:get/get.dart';
import 'package:admindashboard/views/dashboard_view.dart';
import 'package:admindashboard/views/crop_management_view.dart';
import 'package:admindashboard/views/farmer_management_view.dart';
import 'package:admindashboard/views/importer_management_view.dart';
import 'package:admindashboard/views/store_management_view.dart';
import 'package:admindashboard/views/orders_view.dart';
import 'package:admindashboard/views/support_view.dart';
import 'package:admindashboard/views/settings/settings_view.dart';
import 'package:admindashboard/views/certificate_verification_view.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String cropManagement = '/crop-management';
  static const String farmerManagement = '/farmer-management';
  static const String importerManagement = '/importer-management';
  static const String storeManagement = '/store-management';
  static const String orders = '/orders';
  static const String support = '/support';
  static const String settings = '/settings';
  static const String certificateVerification = '/certificate-verification';

  static final List<GetPage> pages = [
    GetPage(name: dashboard, page: () => const DashboardView()),
    GetPage(name: cropManagement, page: () => const CropManagementView()),
    GetPage(name: farmerManagement, page: () => const FarmerManagementView()),
    GetPage(name: importerManagement, page: () => const ImporterManagementView()),
    GetPage(name: storeManagement, page: () => const StoreManagementView()),
    GetPage(name: orders, page: () => const OrdersView()),
    GetPage(name: support, page: () => const SupportView()),
    GetPage(name: settings, page: () => const SettingsView()),
    GetPage(name: certificateVerification, page: () => const CertificateVerificationView()),
  ];
}