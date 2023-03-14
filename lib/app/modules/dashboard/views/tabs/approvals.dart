import 'package:daily_task/app/modules/dashboard/views/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_components/responsive_builder.dart';
import '../../../product/views/product_Listview.dart';

class Approvals extends GetView<DashboardController> {
  const Approvals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) {
        print("mobileBuilder");

        return const ProductListView("Approvals");
      },
      tabletBuilder: (context, constraints) {
        print("tabletBuilder");
        return const ProductListView("Approvals");
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
            const Expanded(child: ProductListView("Approvals")),
          ],
        );
      },
    );
  }
}
