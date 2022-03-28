import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This class creates a standar for a sliver App Bar.
class PineapleAppBarWidget {
  /// The method that builds the App Bar.
  /// * `backgroundColor` is The color that will have the app bar when is closed.
  /// * `title` is The title shown in the app bar.
  /// * `urlBackgroundImage` is The image that will have the app bar when is open.
  /// * `expandedHeight & collapsedHeight` is The height when the app bar is expanded or collapsed.
  /// * `borderRadius` is The radius of the app bar in the borders.
  static SliverAppBar buildAppBar({
    required Color backgroundColor,
    required String title,
    required String urlBackgroundImage,
    double? expandedHeight,
    double? collapsedHeight,
    BorderRadius? borderRadius,
  }) {
    expandedHeight ??= Get.size.height * 0.3;
    borderRadius ??= const BorderRadius.vertical(bottom: Radius.circular(25));
    collapsedHeight = max(Get.size.width / 10, 60);

    return SliverAppBar(
      // The shape of the app bar's [Material] as well as its shadow.
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      floating: true,
      pinned: true,
      elevation: 2.0,
      backgroundColor: backgroundColor,
      // // The back button represented with and arrow.
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.arrow_back_rounded,
      //   ),
      //   color: Colors.white,
      //   onPressed: () => Get.back(),
      //   iconSize: Get.size.width / 16,
      // ),
      flexibleSpace: FlexibleSpaceBar(
        // The title of the app bar.
        title: Text(
          title,
          style: Get.theme.textTheme.headline5?.copyWith(
            fontSize: Get.size.width / 15,
          ),
          maxLines: 1,
        ),
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            // The image of the app bar.
            image: DecorationImage(
              image: AssetImage(urlBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
