import 'package:pineaple_pos_client/clean/controller/crud_controller_async.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class PineapleAreaController
    extends CRUDControllerAsync<PineapleAreaDomain> {
  List<PineapleAreaDomain> get findAllLoaded;
  int get loadedCount;

  /// The controller of the refresh widget.
  RefreshController get refreshController;

  /// Boolean to control if the app is refreshing.
  bool get isRefreshing;

  /// The function to execute when the user refresh the app.
  Future<void> onRefresh();

  /// The function to execute when the user load the app.
  Future<void> onLoading();
}
