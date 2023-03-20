import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constans/app_constants.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({
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
  State<PickImageWidget> createState() => _ImageCaptureWidgetState();
}

class _ImageCaptureWidgetState extends State<PickImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: M,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
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
