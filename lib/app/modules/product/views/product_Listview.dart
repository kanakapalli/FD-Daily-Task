import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constans/app_constants.dart';
import '../controllers/product_controller.dart';
import 'components/header_weekly_task.dart';
import 'components/weekly_task.dart';

class ProductListView extends GetView<ProductController> {
  const ProductListView(
    this.title, {
    Key? key,
    this.showButtons = false,
  }) : super(key: key);
  final String title;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          HeaderWeeklyTask(
            title: title,
            showButtons: showButtons,
          ),
          const SizedBox(height: kSpacing),
          WeeklyTask(
            data: controller.weeklyTask,
            onPressed: controller.onPressedTask,
            onPressedAssign: controller.onPressedAssignTask,
            onPressedMember: controller.onPressedMemberTask,
          )
        ],
      ),
    );
  }
}
