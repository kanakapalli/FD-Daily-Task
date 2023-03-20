import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:daily_task/app/shared_components/imagepicker/cropper_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../constans/app_constants.dart';

class ApiImagePicker extends StatefulWidget {
  const ApiImagePicker({
    Key? key,
  }) : super(key: key);

  // final ImagePicker _picker;
  // final String title;
  // final Map<String, XFile?> pickedImage;

  @override
  State<ApiImagePicker> createState() => _ApiImagePickerState();
}

class _ApiImagePickerState extends State<ApiImagePicker> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: kFontColorPallets[1],
      strokeWidth: .5,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      child: InkWell(
        onTap: () async {
          _showMyDialog(context);
        },
        child: SizedBox(
          width: double.infinity,
          height: 240,
          child: Visibility(
            visible: cropedfile == null,
            child: Icon(
              EvaIcons.plus,
              color: kFontColorPallets[1],
              size: 15,
            ),
            replacement: cropedfile != null
                ? Image.memory(cropedfile!)
                : const SizedBox(),
          ),
        ),
      ),
    );
  }

  Uint8List? cropedfile;

  set setcropedfile(Uint8List data) => setState(() => cropedfile = data);

  Future<void> _showMyDialog(context) async {
    int? selectedIndex = 1;
    bool cropMode = false;
    bool isLoading = false;

    CropController cropcontroller = CropController();

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Select and Crop image'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: cropMode
                  ? CropperView(
                      controller: cropcontroller,
                      onCrop: (cropData) {
                        setcropedfile = cropData;
                        isLoading = false;
                        setState(() {});
                        Navigator.of(context).pop();
                      })
                  : Wrap(
                      children: [
                        ...List.generate(22, (int index) => index,
                                growable: true)
                            .map(
                          (e) {
                            return InkWell(
                              onTap: () {
                                selectedIndex = e;
                                print(selectedIndex);
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(8),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: e == selectedIndex
                                        ? Border.all(
                                            width: 3,
                                            color:
                                                Theme.of(context).primaryColor)
                                        : null,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                              ),
                            );
                          },
                        ).toList()
                      ],
                    ),
            ),
            actions: <Widget>[
              if (!cropMode)
                TextButton(
                  child: const Text('Crop'),
                  onPressed: () {
                    cropMode = true;
                    setState(() {});
                    // Navigator.of(context).pop();
                  },
                ),
              if (cropMode)
                TextButton(
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive()): const Text('select')
                      ,
                  onPressed: () {
                    // cropMode = true;
                    print("triggering the function");
                    isLoading = true;
                    setState(() {});

                    cropcontroller.crop();
                    // Navigator.of(context).pop();
                  },
                ),
            ],
          );
        });
      },
    );
  }
}

// trying to create custom alertDialog with StatefulBuilder to change its state
class Testate extends AlertDialog {
  const Testate(
      {required this.setState,
      Key? key,
      Widget? title,
      List<Widget>? actions,
      Widget? content})
      : super(key: key, title: title, actions: actions, content: content);
  final StateSetter setState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulBuilder(builder: (context, setState) {
      return super.build(
        context,
      );
    });
  }
}
