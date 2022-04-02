import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PineapleAreaScreen extends GetView<PineapleAreaController> {
// ignore: constant_identifier_names
  static const ROUTE_NAME = "/pineaple-area-screen";

  const PineapleAreaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A controller to controll header and footer state, it can trigger driving request Refresh.
    RefreshController _refreshController = RefreshController(
      initialRefresh: false,
    );

    // A key for the refresh Widget.
    GlobalKey _refresherKey = GlobalKey();

    // The function to execute when the user refresh the app.
    void _onRefresh() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _refreshController.refreshCompleted();
    }

    // The function to execute when the user load the app.
    void _onLoading() async {
      await Future.delayed(const Duration(milliseconds: 250));
      _refreshController.loadComplete();
    }

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
        body: SmartRefresher(
          // The key of the widget.
          key: _refresherKey,
          // Controll the inner state.
          controller: _refreshController,
          // This bool will affect whether or not to have the function of drop-down refresh.
          enablePullDown: true,
          // Header indicator displace before content.
          header: WaterDropMaterialHeader(
            // The color of the header.
            backgroundColor: Get.theme.colorScheme.secondary,
            // To prevent the view get out from the sliver app bar.
            offset: -5,
          ),
          // Builds the child to refresh in this case a grid view.
          child: _buildGridView(),
          physics: const BouncingScrollPhysics(),
          // Footer indicator display after content.
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowWhenLoading,
            completeDuration: Duration(milliseconds: 500),
          ),
          // Callback when header refresh.
          onRefresh: _onRefresh,
          // Callback when footer loading more data.
          onLoading: _onLoading,
        ),
      ),
    );
  }

  _buildAppBar() {
    return PineapleAppBarWidget.buildAppBar(
      backgroundColor: Get.theme.colorScheme.secondary,
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
              singleLevelDomain: areaDomain,
              buildName: areaDomain.name,
              colorPrimary: Get.theme.colorScheme.primary,
              openWidget: const Text('data'),
            ),
          )
          .toList(),
    );
  }
}
