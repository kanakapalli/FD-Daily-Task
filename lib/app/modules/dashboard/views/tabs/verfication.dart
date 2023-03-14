import 'package:daily_task/app/modules/dashboard/views/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_components/responsive_builder.dart';
import '../../../product/views/product_Listview.dart';

class Verification extends GetView<DashboardController> {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) {
        print("mobileBuilder");

        return const ProductListView("Verification");
      },
      tabletBuilder: (context, constraints) {
        print("tabletBuilder");
        return const ProductListView("Verification");
      },
      desktopBuilder: (context, constraints) {
        print("desktopBuilder");

        return Row(
          children: [
            CustomDrawer(
              controller: controller,
              changeIndex: controller.changeIndex,
              currentIndex: controller.currentIndex.value,
            ),
            const Expanded(child: ProductListView("Verification")),
          ],
        );
      },
    );
  }
}
