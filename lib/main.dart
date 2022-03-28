import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pineaple Áreas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PineapleAreaScreen.ROUTE_NAME,
      getPages: [
        GetPage(
          name: PineapleAreaScreen.ROUTE_NAME,
          page: () => const PineapleAreaScreen(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
