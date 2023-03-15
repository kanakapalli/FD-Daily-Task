import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/modules/dashboard/views/screens/dashboard_screen.dart';
import 'package:daily_task/app/shared_components/raw_product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_components/responsive_builder.dart';
import '../../../DataAcquisitionMobile/views/data_acquisition_mobile_view.dart';
import '../../../product/views/product_Listview.dart';

class Uploader extends GetView<DashboardController> {
  const Uploader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) {
        print("mobileBuilder");

        return const DataAcquisitionMobileView();
      },
      tabletBuilder: (context, constraints) {
        print("tabletBuilder");
        return const RawProductGrid();
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
            const Expanded(child: ProductListView("Uploader")),
          ],
        );
      },
    );
  }
}
