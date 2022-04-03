import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePOSScreen extends GetView<PineaplePOSController> {
// ignore: constant_identifier_names
  static const ROUTE_NAME = "/pineaple-pos-screen";

  final int areaID;

  PineaplePOSScreen({
    required List<PineapleAreaDomain> areaList,
    required this.areaID,
    Key? key,
  }) : super(key: key) {
    //clear the controller before start
    Get.delete<PineaplePOSController>();
    //set up the new controller
    Get.put<PineaplePOSController>(
      PineaplePOSControllerImpl(
        areaList: areaList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // A key for the refresh Widget.
    GlobalKey _refreshPOSKey = GlobalKey();

    return Scaffold(
      // The background color of the screen.
      backgroundColor: Get.theme.colorScheme.background,
      // Creates a nested scroll view.
      body: NestedScrollView(
        headerSliverBuilder: (c, s) => [
          // Builds the sliver app bar.
          _buildAppBar(),
        ],
        // Creates a widget to help attach the refresh and load of the content of the app.
        body: GetBuilder<PineapleAreaController>(builder: (_) {
          // Creates a widget that absorbs pointers during hit testing.
          return PineapleRefreshWidget.buildRefreshWidget(
            refreshKey: _refreshPOSKey,
            isRefreshing: controller.isRefreshing,
            refreshController: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            waterDropColor: Get.theme.colorScheme.primary,
            gridShimmer: PineapleRefreshWidget.buildShimmerGrid(
              isRefreshing: controller.isRefreshing,
              baseColor: Colors.grey.shade300,
              highlightColor: Get.theme.colorScheme.primary,
            ),
            gridView: PineapleRefreshWidget.buildGridView(
              children: controller
                  .findByArea(areaID)
                  .map(
                    (posDomain) => PineapleOpenContainerWidget(
                      closeWidget: _buildTileClosed(posDomain.name),
                      colorPrimary: Get.theme.colorScheme.primary,
                      openWidget: _buildTileOpen(),
                    ),
                  )
                  .toList(),
            ),
          );
        }),
      ),
    );
  }

  _buildAppBar() {
    return PineapleAppBarWidget.buildAppBar(
      backgroundColor: Get.theme.colorScheme.primary,
      title: "Puntos de Venta",
      urlBackgroundImage: PineapleAssets.AREA_IMAGE,
    );
  }

  /// Tile when is small that shows a list with all the different areas.
  _buildTileClosed(String buildName) {
    return AutoSizeText(
      buildName,
      textAlign: TextAlign.center,
      style: Get.theme.textTheme.headline6?.copyWith(
        fontSize: Get.size.width / 13,
      ),
    );
  }

  /// The screen to show when the user select one of the small tiles.
  _buildTileOpen() {
    return Container();
  }
}
