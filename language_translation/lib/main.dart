import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/viewModal/HomeController/home_controller_binding.dart';
import 'package:language_translation/views/home/home_screen.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: HomeControllerBinding(),
      home: const HomeScreen(),
      getPages: AppPages.pages,
    );
  }
}
