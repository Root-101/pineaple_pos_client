import 'package:pineaple_pos_client/clean/controller/crud_controller_async.dart';
import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class PineaplePosController
    extends CRUDControllerAsync<PineaplePosDomain> {
  List<PineaplePosDomain> get findAllLoaded;

  int get loadedCount;

  /// Find all the points of sell that belong to the same area.
  List<PineaplePosDomain> findByArea(PineapleAreaDomain areaDomain);

  /// The controller of the refresh widget.
  RefreshController get refreshController;

  /// Boolean to control if the app is refreshing.
  bool get isRefreshing;

  /// The function to execute when the user refresh the app.
  Future<void> onRefresh();

  /// The function to execute when the user load the app.
  Future<void> onLoading();
}
