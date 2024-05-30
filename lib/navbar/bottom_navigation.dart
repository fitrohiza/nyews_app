import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyews_app/controller/navbar_controller.dart';
import 'package:nyews_app/pages/about/about_page.dart';
import 'package:nyews_app/pages/home/home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              HomePage(),
              AboutPage(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey.shade300,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            items: [
              _bottomNavigationItems(Icons.home, 'Home'),
              _bottomNavigationItems(Icons.info, 'About'),
            ],
          )),
    );
  }
}

BottomNavigationBarItem _bottomNavigationItems(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
