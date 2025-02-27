part of dashboard;

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
  }
}
