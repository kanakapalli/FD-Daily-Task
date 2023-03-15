import 'dart:io';

import 'package:daily_task/app/shared_components/header_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constans/app_constants.dart';
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
            ...controller.sections.map((e) => ImageCaptureWidget(
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

class ImageCaptureWidget extends StatefulWidget {
  const ImageCaptureWidget({
    Key? key,
    required ImagePicker picker,
    required this.title,
    required this.pickedImage,
  })  : _picker = picker,
        super(key: key);

  final ImagePicker _picker;
  final String title;
  final Map<String, XFile?> pickedImage;

  @override
  State<ImageCaptureWidget> createState() => _ImageCaptureWidgetState();
}

class _ImageCaptureWidgetState extends State<ImageCaptureWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: M,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only( left:12.0),
          child: Text(
              widget.title,
              style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DottedBorder(
            color: kFontColorPallets[1],
            strokeWidth: .5,
            strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            child: InkWell(
              onTap: () async {
                widget.pickedImage[widget.title] =
                    await widget._picker.pickImage(source: ImageSource.camera);
                setState(() {});
              },
              child: SizedBox(
                width: double.infinity,
                height: 240,
                child: Visibility(
                  visible: widget.pickedImage[widget.title] == null,
                  child: Icon(
                    EvaIcons.plus,
                    color: kFontColorPallets[1],
                    size: 15,
                  ),
                  replacement: widget.pickedImage[widget.title] != null
                      ? Image.file(File(widget.pickedImage[widget.title]!.path))
                      : const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
