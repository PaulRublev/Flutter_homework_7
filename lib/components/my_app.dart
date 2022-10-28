import 'package:albums_route/components/about_page.dart';
import 'package:albums_route/components/error_page.dart';
import 'package:albums_route/components/home_page.dart';
import 'package:albums_route/components/utils.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artists',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const ErrorPage());
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(
                builder: (BuildContext context) => const MyHomePage());
          case AboutPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return createAboutPageRoute(args);
          default:
            return MaterialPageRoute(
                builder: (BuildContext context) => const ErrorPage());
        }
      },
    );
  }
}
