import 'package:daily_task/app/modules/dashboard/views/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_components/responsive_builder.dart';
import '../../../product/views/product_Listview.dart';
import '../components/rigthSlider.dart';

class OCRCheck extends GetView<DashboardController> {
  const OCRCheck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) {
        print("mobileBuilder");

        return const ProductListView("Check OCR (recently added)",showButtons: true,);
      },
      tabletBuilder: (context, constraints) {
        print("tabletBuilder");
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: constraints.maxWidth > 800 ? 8 : 7,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ProductListView(
                      "Check OCR (recently added)",
                      showButtons: true,
                    ),
                    ProductListView(
                      "Rework",
                      showButtons: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const VerticalDivider(),
            ),
            const Flexible(
              flex: 4,
              child: RightSlider(),
            ),
          ],
        );
      },
      desktopBuilder: (context, constraints) {
        print("desktopBuilder");

        return Obx(() {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDrawer(
                controller: controller,
                changeIndex: controller.changeIndex,
                currentIndex: controller.currentIndex.value,
              ),
              // const VerticalDivider(thickness: 1, width: 1),
              // sidebar
              // Flexible(
              //   flex: constraints.maxWidth > 1350 ? 3 : 4,
              //   child: SingleChildScrollView(
              //     controller: ScrollController(),
              //     child: _buildSidebar(context),
              //   ),
              // ),

              Flexible(
                flex: constraints.maxWidth > 1350 ? 10 : 9,
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: const ProductListView(
                    "Check OCR (recently added)",
                    showButtons: true,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const VerticalDivider(),
              ),
              const Flexible(
                flex: 4,
                child: RightSlider(),
              ),
            ],
          );
        });
      },
    );
  }
}
