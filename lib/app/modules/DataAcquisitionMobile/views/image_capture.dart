import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constans/app_constants.dart';
import '../../../shared_components/imagepicker/image_picker.dart';
import '../controllers/data_acquisition_mobile_controller.dart';

class ImageCaptureView extends GetView<DataAcquisitionMobileController> {
  const ImageCaptureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageCaptureView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => ElevatedButton(
                onPressed: () => controller.scanBarcodeNormal(),
                child:
                    Text('Start barcode scan : ${controller.barcode.value}'))),
            ...controller.sections.map((e) => PickImageWidget(
                title: e,
                picker: controller.picker,
                pickedImage: controller.pickedImages)),
            const SizedBox(
              height: kSpacing,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                if (controller.pickedImages.length == 4) {
                  print("all added");
                } else {
                  print("add all images");
                }
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30)),
                  //  minimumSize: MaterialStateProperty.all(
                  //   const Size(400, 60)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: BorderSide(
                      //   width: 1.0,
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * 0.9, 60))),
              icon: const Icon(EvaIcons.doneAll),
              label: const Text('Done'),
            ),
            const SizedBox(
              height: kSpacing * 1.5,
            )
          ],
        ),
      ),
    );
  }
}
