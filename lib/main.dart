import 'package:flutter/material.dart';
import 'package:trinity_demo/imports.dart';
import 'dependency_injection.dart';

void main() {
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.getTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.routeSplash,
      getPages: AppPage.routes,
      unknownRoute: GetPage(
          name: "/unknownRoute",
          page: () => Scaffold(
                body: Center(child: text("No Data Found", colorAppBlack, 24, FontWeight.bold)),
              )),
    );
  }
}

 