import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class PineapleAreaScreen extends GetView<PineapleAreaController> {
// ignore: constant_identifier_names
  static const ROUTE_NAME = "/pineaple-area-screen";

  const PineapleAreaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A key for the refresh Widget.
    GlobalKey _refresherKey = GlobalKey();

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
          return AbsorbPointer(
            // Don't allow the user to press any widget while this property is in true.
            absorbing: controller.isRefreshing,
            child: SmartRefresher(
              // The key of the widget.
              key: _refresherKey,
              // Controll the inner state.
              controller: controller.refreshController,
              // This bool will affect whether or not to have the function of drop-down refresh.
              enablePullDown: true,
              // Header indicator displace before content.
              header: WaterDropMaterialHeader(
                // The color of the header.
                backgroundColor: Get.theme.colorScheme.primary,
                // To prevent the view get out from the sliver app bar.
                offset: -5,
              ),
              // Builds the child to refresh in this case a grid view.
              child: controller.isRefreshing
                  ? _buildTileRefresh()
                  : _buildGridView(),
              physics: const BouncingScrollPhysics(),
              // Footer indicator display after content.
              footer: const ClassicFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
                completeDuration: Duration(milliseconds: 500),
              ),
              // Callback when header refresh.
              onRefresh: controller.onRefresh,
              // Callback when footer loading more data.
              onLoading: controller.onLoading,
            ),
          );
        }),
      ),
    );
  }

  _buildAppBar() {
    return PineapleAppBarWidget.buildAppBar(
      backgroundColor: Get.theme.colorScheme.primary,
      title: PineapleUIModule.MODULE_NAME,
      urlBackgroundImage: PineapleUIModule.URL_AREA_BACKGROUND,
    );
  }

  _buildGridView() {
    return GridView.count(
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
              closeWidget: _buildTileClosed(areaDomain.name),
              colorPrimary: Get.theme.colorScheme.primary,
              openWidget: _buildTileOpen(),
            ),
          )
          .toList(),
    );
  }

  /// Tile when the list is refreshing.
  _buildTileRefresh() {
    return Transform.translate(
      offset: const Offset(0.0, -25.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Get.theme.colorScheme.primary,
        enabled: controller.isRefreshing,
        child: GridView.count(
          // Amount of columns.
          crossAxisCount: 2,
          // Space beteween the items.
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          // The tiles.
          children: List.generate(
            4,
            (index) => PineapleAreaTile(
              closeWidget: _buildTileClosed(""),
              openWidget: _buildTileOpen(),
            ),
          ).toList(),
        ),
      ),
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
