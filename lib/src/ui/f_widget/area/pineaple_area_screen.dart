import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaScreen extends GetView<PineapleAreaController> {
// ignore: constant_identifier_names
  static const ROUTE_NAME = "/pineaple-area-screen";

  const PineapleAreaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The available space or size that the device have.
    Size deviceSize = MediaQuery.of(context).size;
    // The height when the app bar is expanded.
    double expandedHeight = deviceSize.height * 0.3;

    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.update();
      }),
      body: SafeArea(
        child: GetBuilder<PineapleAreaController>(builder: (_) {
          print('updating');
          return FutureBuilder<List<PineapleAreaDomain>>(
            future: controller.findAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return snapshot.data == null
                    ? Text("no data")
                    : Column(
                        children: snapshot.data!
                            .map(
                              (areaDomain) => Text(areaDomain.name),
                            )
                            .toList(),
                      );
              }
            },
          );
        }),
      ),
    );
  }

  Future<List<PineapleAreaDomain>> all() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      PineapleAreaDomain(id: 1, name: "hi 1"),
      PineapleAreaDomain(id: 2, name: "hi 2"),
      PineapleAreaDomain(id: 3, name: "hi 3"),
    ];
  }
}
