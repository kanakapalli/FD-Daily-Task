
part of dashboard;

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.controller,
    required this.currentIndex,
    required this.changeIndex,
  }) : super(key: key);

  final DashboardController controller;
  final int currentIndex;
  final Function(int) changeIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: changeIndex,
      minWidth: 80,
      minExtendedWidth: 160,
      extended: true,
      // labelType: NavigationRailLabelType.all,
      // selectedIconTheme:
      //     const IconThemeData(color: Colors.white),
      // selectedLabelTextStyle:
      //     TextStyle(color: Colors.lightBlue[500]),
      // unselectedLabelTextStyle:
      //     TextStyle(color: Colors.grey[500]),
      elevation: 5,
      useIndicator: true,
      // backgroundColor: Colors.grey[50],
      // indicatorColor: Colors.cyan[50],
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: UserProfile(
          data: controller.dataProfil,
          onPressed: controller.onPressedProfil,
        ),
      ),
      //trailing: const MyTrailingWidget(),
      destinations: const <NavigationRailDestination>[
         NavigationRailDestination(
          icon: Icon(Icons.house_outlined),
          selectedIcon: Icon(Icons.house),
          label: Text('Uploader'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.house_outlined),
          selectedIcon: Icon(Icons.house),
          label: Text('OCR check'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.star),
          label: Text('Verification'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle),
          label: Text('Approvals'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle),
          label: Text('Overview'),
        ),
      ],
    );
  }
}
