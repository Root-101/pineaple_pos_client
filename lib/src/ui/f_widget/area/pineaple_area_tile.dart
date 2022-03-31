import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PineapleAreaTile<PineapleAreaDomain> extends StatelessWidget {
  final PineapleAreaDomain singleLevelDomain;

  final String buildName;
  final Widget openWidget;

  final Color colorPrimary;

  const PineapleAreaTile({
    required this.singleLevelDomain,
    required this.buildName,
    required this.openWidget,
    this.colorPrimary = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder closedShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OpenContainer(
        closedShape: closedShape,
        transitionDuration: const Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(),
        openBuilder: (context, action) => _buildOpen(),
        closedColor: colorPrimary,
        middleColor: colorPrimary,
      ),
    );
  }

  // Tile when is small that shows a list with all the different areas.
  _buildClosed() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: AutoSizeText(
        buildName,
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.headline6?.copyWith(
          fontSize: Get.size.width / 13,
        ),
      ),
    );
  }

  // The screen to show when the user select one of the small tiles.
  _buildOpen() {
    return openWidget;
  }
}
