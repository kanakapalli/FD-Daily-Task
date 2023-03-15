import 'package:daily_task/app/config/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared_components/raw_product_grid.dart';
import '../../product/views/product_Listview.dart';
import '../controllers/data_acquisition_mobile_controller.dart';

class DataAcquisitionMobileView
    extends GetView<DataAcquisitionMobileController> {
  const DataAcquisitionMobileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RawProductGrid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Get.toNamed(Routes.imageCapture);
        },
        // backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
