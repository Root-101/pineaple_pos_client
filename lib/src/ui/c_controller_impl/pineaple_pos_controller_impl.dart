import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PineaplePOSControllerImpl extends PineaplePOSController {
  late final PineaplePOSUseCase posUseCase;

  PineaplePOSControllerImpl({
    required List<PineapleAreaDomain> areaList,
  }) : posUseCase = PineaplePOSUseCaseImpl(areaList: areaList);

  /// A controller to controll header and footer state, it can trigger driving request Refresh.
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  /// Find all the areas.
  @override
  List<PineaplePOSDomain> findAll() {
    return posUseCase.findAll();
  }

  /// Find all the points of sell that belong to the same area.
  @override
  List<PineaplePOSDomain> findByArea(int areaID) {
    return posUseCase.findByArea(areaID);
  }

  /// The controller of the refresh widget.
  @override
  RefreshController get refreshController => _refreshController;

  /// Boolean to control if the app is refreshing.
  @override
  bool get isRefreshing => _refreshController.isRefresh;

  /// The function to execute when the user refresh the app.
  @override
  void onRefresh() async {
    update();
    await Future.delayed(const Duration(milliseconds: 3000));
    _refreshController.refreshCompleted();
    update();
  }

  /// The function to execute when the user load the app.
  @override
  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 250));
    _refreshController.loadComplete();
  }
}
