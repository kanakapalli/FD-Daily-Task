import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CropperView extends StatefulWidget {
  const CropperView({Key? key}) : super(key: key);

  @override
  State<CropperView> createState() => _CropperViewState();
}

class _CropperViewState extends State<CropperView> {
  final _controller = CropController();

  String imageUrl =
      "https://images.unsplash.com/photo-1489389944381-3471b5b30f04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80";

  loadData() async {
    final response = await http.get(Uri.parse(imageUrl));
    image = response.bodyBytes;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Uint8List? image;
  List<Uint8List> croppedImageData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: image == null
            ? const SizedBox()
            : Crop(
                controller: _controller,
                image: image!,
                onCropped: (cropped) {
                  croppedImageData.add(cropped);
                  setState(() {});
                  // isProcessing = false;
                },
              ),
        floatingActionButton: Row(
          children: [
            ...croppedImageData
                .map(
                  (e) => Image.memory(
                    e,
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                  ),
                )
                .toList(),
            // if (croppedImageData != null)
            //   Image.memory(
            //     croppedImageData!,
            //     fit: BoxFit.contain,
            //     width: 80,
            //     height: 80,
            //   ),
            GestureDetector(
              onTap: () {
                _controller.crop();
                setState(() {});
              },
              child: Container(
                  color: Colors.amber,
                  width: 80,
                  height: 80,
                  child: const Text("+")),
            ),
            // GestureDetector(
            //     onTap: () => setState(() {
            //         }),
            //     child: const Text("-")),
          ],
        ));
  }
}
