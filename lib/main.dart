import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_app/screen/home_page.dart';
import 'package:getx_app/screen/on_boarding_page.dart';

void main() => runApp(MyMain());

class MyMain extends StatelessWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => OnboardingPage(),
        ),
        GetPage(name: "/homepage", page: () => HomePage())
      ],
    );
  }
}
