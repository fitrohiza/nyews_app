import 'package:get/get.dart';
import 'package:nyews_app/navbar/bottom_navigation.dart';
import 'package:nyews_app/pages/about/about_page.dart';
import 'package:nyews_app/pages/home/home_page.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: about, page: () => const AboutPage())
  ];

  static getNavbar() => navbar;
  static getHome() => home;
  static getAbout() => about;

  static String navbar = '/';
  static String home = '/home';
  static String about = '/about';
}
