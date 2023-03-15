import 'package:get/get.dart';

import '../controllers/data_acquisition_mobile_controller.dart';

class DataAcquisitionMobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataAcquisitionMobileController>(
      () => DataAcquisitionMobileController(),
    );
  }
}
