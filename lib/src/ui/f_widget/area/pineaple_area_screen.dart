import 'package:flutter/material.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:sliver_fab/sliver_fab.dart';

class PineapleAreaScreen extends StatefulWidget {
// ignore: constant_identifier_names
  static const ROUTE_NAME = "/pineaple-area-screen";

  const PineapleAreaScreen({Key? key}) : super(key: key);

  @override
  State<PineapleAreaScreen> createState() => _PineapleAreaScreenState();
}

class _PineapleAreaScreenState extends State<PineapleAreaScreen> {
  late final PineapleAreaController _controller;

  @override
  Widget build(BuildContext context) {
    // The available space or size that the device have.
    Size deviceSize = MediaQuery.of(context).size;
    // The height when the app bar is expanded.
    double expandedHeight = deviceSize.height * 0.3;

    return Scaffold(
      body: Builder(builder: (context) {
        return SliverFab(
          // FloatingActionButton placed on the edge of FlexibleAppBar and rest of view.
          // Right now is not necessary.
          floatingWidget: const SizedBox(),
          // The height of the widget when is expanded
          expandedHeight: expandedHeight,
          slivers: <Widget>[
            // This builds the sliver app bar.
            PineapleAppBarWidget.buildAppBar(
              backgroundColor: PineapleUIModule.PRIMARY_COLOR,
              title: PineapleUIModule.MODULE_NAME,
              urlBackgroundImage: PineapleUIModule.URL_MODULE_BACKGROUND,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  30,
                  (int index) => ListTile(title: Text("Item $index")),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
