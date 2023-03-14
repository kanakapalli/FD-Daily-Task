import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';
import '../../../../shared_components/list_task_date.dart';
import '../screens/dashboard_screen.dart';

class RightSlider extends GetView<DashboardController> {
  const RightSlider({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RightSliderSection(
              controller: controller,
              title: "pending",
              onClickIcon: controller.onPressedCalendar,
              onClickTile: controller.onPressedTaskGroup,
            ),
            RightSliderSection(
              controller: controller,
              title: "completed",
              onClickIcon: controller.onPressedCalendar,
              onClickTile: controller.onPressedTaskGroup,
            ),
          ],
        ),
      ),
    );
  }
}

class RightSliderSection extends StatelessWidget {
  const RightSliderSection({
    Key? key,
    required this.controller,
    required this.title,
    required this.onClickIcon,
    required this.onClickTile,
  }) : super(key: key);

  final DashboardController controller;
  final String title;
  final VoidCallback onClickIcon;
  final Function(int, ListTaskDateData) onClickTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kSpacing),
        Row(
          children: [
            Expanded(child: HeaderText(title)),
            IconButton(
              onPressed: onClickIcon,
              icon: const Icon(EvaIcons.calendarOutline),
              tooltip: title,
            )
          ],
        ),
        const SizedBox(height: kSpacing),
        ListView.builder(
            shrinkWrap: true,
            itemCount: controller.taskGroup.length,
            itemBuilder: (context, i) {
              return TaskGroup(
                title: DateFormat('d MMMM')
                    .format(controller.taskGroup[i][0].date),
                data: controller.taskGroup[i],
                onPressed: onClickTile,
              );
            })
      ],
    );
  }
}
