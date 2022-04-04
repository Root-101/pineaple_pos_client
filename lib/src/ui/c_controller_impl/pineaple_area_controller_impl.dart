import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PineapleAreaControllerImpl extends PineapleAreaController {
  final PineapleAreaUseCase areaUseCase;

  PineapleAreaControllerImpl({required this.areaUseCase});

  /// A controller to controll header and footer state, it can trigger driving request Refresh.
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  /// Find all the areas.
  @override
  Future<List<PineapleAreaDomain>> findAll() async {
    return await areaUseCase.findAll();
  }

  Future<PineapleAreaDomain> create(PineapleAreaDomain object) async {
    return await areaUseCase.create(object);
  }

  Future<PineapleAreaDomain> destroy(PineapleAreaDomain object) async {
    return await areaUseCase.destroy(object);
  }

  Future<PineapleAreaDomain> edit(PineapleAreaDomain object) async {
    return await areaUseCase.edit(object);
  }

  Future<PineapleAreaDomain> findBy(int id) async {
    return await areaUseCase.findBy(id);
  }

  Future<int> count() async {
    return await areaUseCase.count();
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
