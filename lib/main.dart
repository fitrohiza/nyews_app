import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyews_app/routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getNavbar(),
    getPages: AppPage.routes,
  ));
}
