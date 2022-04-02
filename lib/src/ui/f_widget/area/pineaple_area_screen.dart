import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:sliver_fab/sliver_fab.dart';

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
      body: SliverFab(
        // FloatingActionButton placed on the edge of FlexibleAppBar and rest of view.
        // Right now is not necessary.
        floatingWidget: const SizedBox(),
        // The height of the widget when is expanded
        expandedHeight: expandedHeight,
        slivers: <Widget>[
          // This builds the sliver app bar.
          PineapleAppBarWidget.buildAppBar(
            backgroundColor: Get.theme.colorScheme.secondary,
            title: PineapleUIModule.MODULE_NAME,
            urlBackgroundImage: PineapleUIModule.URL_AREA_BACKGROUND,
          ),
          SliverGrid.count(
            // Amount of columns.
            crossAxisCount: 2,
            // Space beteween the items.
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            // The tiles.
            children: controller
                .findAll()
                .map(
                  (areaDomain) => PineapleAreaTile(
                    singleLevelDomain: areaDomain,
                    buildName: areaDomain.name,
                    colorPrimary: Get.theme.colorScheme.primary,
                    openWidget: const Text('data'),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
