import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class PineapleAreaTile<PineapleAreaDomain> extends StatelessWidget {
  final Widget closeWidget;
  final Widget openWidget;

  final Color colorPrimary;

  const PineapleAreaTile({
    required this.closeWidget,
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
    return closeWidget;
  }

  // The screen to show when the user select one of the small tiles.
  _buildOpen() {
    return openWidget;
  }
}
