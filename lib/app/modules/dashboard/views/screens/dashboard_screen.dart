library dashboard;

import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/modules/dashboard/views/tabs/tabs.dart';
import 'package:daily_task/app/shared_components/card_task.dart';
import 'package:daily_task/app/shared_components/header_text.dart';
import 'package:daily_task/app/shared_components/list_task_assigned.dart';
import 'package:daily_task/app/shared_components/list_task_date.dart';
import 'package:daily_task/app/shared_components/selection_button.dart';
import 'package:daily_task/app/shared_components/simple_selection_button.dart';
import 'package:daily_task/app/shared_components/simple_user_profile.dart';
import 'package:daily_task/app/shared_components/task_progress.dart';
import 'package:daily_task/app/shared_components/user_profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/controllers/product_controller.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// model

// component
part '../components/bottom_navbar.dart';
part '../components/header_weekly_task.dart';
part '../components/main_menu.dart';
part '../components/task_menu.dart';
part '../components/member.dart';
part '../components/task_in_progress.dart';
part '../components/weekly_task.dart';
part '../components/task_group.dart';
part '../components/drawer.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          key: controller.scafoldKey,
          drawer: SizedBox(
              width: 300,
              child: Obx(() => CustomDrawer(
                    controller: controller,
                    changeIndex: controller.changeIndex,
                    currentIndex: controller.currentIndex.value,
                  ))),
          
          appBar: PreferredSize(
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth >= 1100) {
                  return const SizedBox();
                }
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: kSpacing / 2),
                      child: Builder(builder: (context) {
                        return IconButton(
                          onPressed: () => controller.openDrawer(),
                          icon: const Icon(Icons.menu),
                        );
                      }),
                    ),
                    // Expanded(
                    //   child: SearchField(
                    //     onSearch: controller.searchTask,
                    //     hintText: "Search Task .. ",
                    //   ),
                    // ),
                  ],
                );
              }),
              preferredSize: const Size(double.infinity, 0)),
          
          // bottomNavigationBar: (ResponsiveBuilder.isDesktop(context) || kIsWeb)
          //     ? null
          //     : const _BottomNavbar(),
          
          body: SafeArea(child: Obx(() => tabs[controller.currentIndex.value])),
        ),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: UserProfile(
              data: controller.dataProfil,
              onPressed: controller.onPressedProfil,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _MainMenu(onSelected: controller.onSelectedMainMenu),
          ),
          const Divider(
            indent: 20,
            thickness: 1,
            endIndent: 20,
            height: 60,
          ),
          // _Member(member: controller.member),
          // const SizedBox(height: kSpacing),
          // _TaskMenu(
          //   onSelected: controller.onSelectedTaskMenu,
          // ),
          // const SizedBox(height: kSpacing),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(kSpacing),
            child: Text(
              "2021 Teamwork lisence",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
