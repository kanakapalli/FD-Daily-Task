import 'package:daily_task/app/modules/product/views/product_detail_view.dart';
import 'package:get/get.dart';

import '../../modules/dashboard/views/screens/dashboard_screen.dart';
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/views/login_view.dart';
import '../../modules/product/bindings/product_binding.dart';
import '../../modules/product/views/product_Listview.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  // static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => const ProductListView(""),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.productDetail,
      page: () => const ProductDetailForm(),
      binding: ProductBinding(),
    ),
  ];
}
