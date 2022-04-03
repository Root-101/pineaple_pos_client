import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class PineapleAreaController extends GetxController {
  List<PineapleAreaDomain> findAll();

  /// The controller of the refresh widget.
  RefreshController get refreshController;

  /// Boolean to control if the app is refreshing.
  bool get isRefreshing;

  /// The function to execute when the user refresh the app.
  void onRefresh();

  /// The function to execute when the user load the app.
  void onLoading();
}
