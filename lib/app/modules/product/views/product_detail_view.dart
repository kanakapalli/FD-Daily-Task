library productdetail;

import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/shared_components/form/form_head_text.dart';
import 'package:daily_task/app/shared_components/form/textfield.dart';
import 'package:daily_task/app/shared_components/imagepicker/api_image_picker.dart';
import 'package:daily_task/app/shared_components/split_widget.dart';
import 'package:daily_task/app/shared_components/task_progress.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/product_controller.dart';

part './components/forms/Ingredients_form.dart';
part './components/forms/barcode_form.dart';
part './components/forms/nutrients_form.dart';

//tabs
part './tabs/form1.dart';
part './tabs/form2.dart';
part './tabs/form3.dart';

class ProductDetailForm extends GetView<ProductController> {
  const ProductDetailForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scafoldKey,
      appBar: AppBar(
        title: const Text('ProductDetailForm'),
        centerTitle: true,
        actions: [
          SizedBox(
              width: 500,
              child: Obx(() => TaskProgress(
                  data: TaskProgressData(
                      totalCompleted: controller.currentIndex.value + 1,
                      totalTask: 3))))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                Form1(),
                Form2(),
                Form3(),

              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.next,
        child: const Icon(EvaIcons.arrowForward),
      ),
    );
  }
}

class ExtractTextFromOCR extends StatelessWidget {
  const ExtractTextFromOCR({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
          ApiImagePicker(),
            const SizedBox(
              height: 12,
            ),
            CustomInputTextField(hintText: "hintText $index")
          ],
        ),
      ),
    );
  }
}

class ProductTitleComponent extends StatelessWidget {
  const ProductTitleComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 540,
      child: Row(
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApiImagePicker(),
                const SizedBox(
                  height: 12,
                ),
                const CustomInputTextField(hintText: "hintText special")
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
              width: 200, child: CustomInputTextField(hintText: "hintText spl"))
        ],
      ),
    );
  }
}
