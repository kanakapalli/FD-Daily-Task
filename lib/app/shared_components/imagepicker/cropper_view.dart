import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CropperView extends StatefulWidget {
  const CropperView({
    Key? key,
    required this.controller,
    required this.onCrop,
  }) : super(key: key);

  final CropController controller;
  final void Function(Uint8List) onCrop;

  @override
  State<CropperView> createState() => _CropperViewState();
}

class _CropperViewState extends State<CropperView> {
  _CropperViewState();

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

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Center(
          child: Row(
            children: [
              CircularProgressIndicator.adaptive(),
              const Text("image loading"),
            ],
          ),
        )
        : Crop(
          // radius: 12,
          // maskColor : Theme.of(context).primaryColor,
          // baseColor: Colors.blue,
          interactive:true,
          onMoved: (value){
            print(value);
          },
          onStatusChanged: (value) {
              print(value);
            },
          // fixArea: true,
            controller: widget.controller,
            image: image!,
            onCropped: widget.onCrop,
          );
    // floatingActionButton: Row(
    //   children: [
    //     ...croppedImageData
    //         .map(
    //           (e) => Image.memory(
    //             e,
    //             fit: BoxFit.contain,
    //             width: 80,
    //             height: 80,
    //           ),
    //         )
    //         .toList(),
    //     // if (croppedImageData != null)
    //     //   Image.memory(
    //     //     croppedImageData!,
    //     //     fit: BoxFit.contain,
    //     //     width: 80,
    //     //     height: 80,
    //     //   ),
    //     GestureDetector(
    //       onTap: () {
    //         _controller.crop();
    //         setState(() {});
    //       },
    //       child: Container(
    //           color: Colors.amber,
    //           width: 80,
    //           height: 80,
    //           child: const Text("+")),
    //     ),
    //     // GestureDetector(
    //     //     onTap: () => setState(() {
    //     //         }),
    //     //     child: const Text("-")),
    //   ],
    // ));
  }
}
