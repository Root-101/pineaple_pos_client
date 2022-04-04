import 'package:flutter/material.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class PineapleRefreshWidget {
  /// The method that builds the Refresh Widget.
  /// * `isRefreshing` this boolean controls if the app refresh.
  /// * `RefreshController` a controller to controll the header and footer state of the widget.
  /// * `onRefresh & onLoading` callback when header refresh or footer loading more data.
  /// * `gridShimmer & gridView` grid to shimme and the grid view with all the info.
  static buildRefreshWidget({
    required bool isRefreshing,
    required RefreshController refreshController,
    required Function()? onRefresh,
    required Function()? onLoading,
    required Widget gridShimmer,
    required Widget gridView,
    GlobalKey? refreshKey,
    Color waterDropColor = Colors.white,
  }) {
    return AbsorbPointer(
      // Don't allow the user to press any widget while this property is in true.
      absorbing: isRefreshing,
      child: SmartRefresher(
        // The key of the widget.
        key: refreshKey,
        // Controll the inner state.
        controller: refreshController,
        // This bool will affect whether or not to have the function of drop-down refresh.
        enablePullDown: true,
        // Header indicator displace before content.
        header: WaterDropMaterialHeader(
          // The color of the header.
          backgroundColor: waterDropColor,
          // To prevent the view get out from the sliver app bar.
          offset: -5,
        ),
        // Builds the child to refresh in this case a grid view.
        child: isRefreshing ? gridShimmer : gridView,
        physics: const BouncingScrollPhysics(),
        // Footer indicator display after content.
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          completeDuration: Duration(milliseconds: 500),
        ),
        // Callback when header refresh.
        onRefresh: onRefresh,
        // Callback when footer loading more data.
        onLoading: onLoading,
      ),
    );
  }

  /// The GridView with all the content.
  /// * `children` tiles of the grid view with all the info.
  static buildGridView({
    required List<Widget> children,
  }) {
    return GridView.count(
      // Amount of columns.
      crossAxisCount: 2,
      // Space beteween the items.
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      // The tiles.
      children: children,
    );
  }

  /// Tiles when the list is refreshing.
  /// * `isRefreshing` this boolean controls if the app makes the shimmer effect.
  /// * `baseColor` the color of the tiles.
  /// * `highlightColor` the color of the shimmer on top of the tiles.
  /// * `shimmerColumnsAmount` amount of columns.
  /// * `shimmerItemsAmount` amount of items.
  static buildShimmerGrid({
    required bool isRefreshing,
    Color baseColor = Colors.grey,
    Color highlightColor = Colors.white,
    int shimmerColumnsAmount = 2,
    int shimmerItemsAmount = 4,
  }) {
    return Transform.translate(
      // So the tiles beggin in the same spot that the real list.
      offset: const Offset(0.0, -25.0),
      // Widget that make the shimer efect.
      child: Shimmer.fromColors(
        // Color of the tile.
        baseColor: baseColor,
        // Color of the shime efect.
        highlightColor: highlightColor,
        // If the shimer efect is showing.
        enabled: isRefreshing,
        // The Grid.
        child: GridView.count(
          // Amount of columns.
          crossAxisCount: shimmerColumnsAmount,
          // Space beteween the items.
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          // The tiles.
          children: List.generate(
            shimmerItemsAmount,
            (index) => PineapleOpenContainerWidget(
              closeWidget: const Text(""),
              openWidget: Container(),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
