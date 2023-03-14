import 'package:daily_task/app/modules/dashboard/views/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_components/responsive_builder.dart';

class OverView extends GetView<DashboardController> {
  const OverView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) {
        print("mobileBuilder");

        return const Center(
          child: Text("mobileBuilder of overview"),
        );
      },
      tabletBuilder: (context, constraints) {
        print("tabletBuilder");
        return const Center(
          child: Text("tabletBuilder of overview"),
        );
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
            const Center(
              child: Text("desktop of overview"),
            ),
          ],
        );
      },
    );
  }
}
