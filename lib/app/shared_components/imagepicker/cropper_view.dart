import 'dart:async';
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
      "https://blog.beaconstac.com/wp-content/uploads/2020/04/Untitled-design.png";

  loadData() async {
    final response = await http.get(Uri.parse(imageUrl));
    image = response.bodyBytes;
    // var decodedImage = await decodeImageFromList(response.re());
    setState(() {});
  }
Size? size ;
  Future<Size> _calculateImageDimension() {
    Completer<Size> completer = Completer();
    Image image = Image.network(imageUrl);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          print("size");

          print(size);
          completer.complete(size);
        },
      ),
    );

    return completer.future;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    _calculateImageDimension();
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
          // interactive:true,
          initialSize: 0.5,
          // fixArea: true,
          onMoved: (value){
            print(value);
            print(value.size.width );
            print(value.size.height);


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
