import 'package:get/get.dart';
import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class PineaplePOSController extends GetxController {
  /// Find all the points of sell.
  List<PineaplePOSDomain> findAll();

  /// The controller of the refresh widget.
  RefreshController get refreshController;

  /// Boolean to control if the app is refreshing.
  bool get isRefreshing;

  /// The function to execute when the user refresh the app.
  void onRefresh();

  /// The function to execute when the user load the app.
  void onLoading();
}
