import 'package:pineaple_pos_client/clean/controller/default_crud_controller_async.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PineapleAreaControllerImpl
    extends DefaultCRUDControllerAsync<PineapleAreaDomain, PineapleAreaUseCase>
    implements PineapleAreaController {
  PineapleAreaControllerImpl({required PineapleAreaUseCase areaUseCase})
      : super(useCase: areaUseCase);

  //store the loaded elements in the list
  //to be able to call it with out the future in findAll
  @override
  List<PineapleAreaDomain> findAllLoaded = [];

  //store the current count of the list
  //for use it in the amount of shined tiles
  @override
  int loadedCount = 0;

  /// A controller to controll header and footer state, it can trigger driving request Refresh.
  @override
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  /// Boolean to control if the app is refreshing.
  @override
  bool get isRefreshing => refreshController.isRefresh;

  /// The function to execute when the user refresh the app.
  @override
  Future<void> onRefresh() async {
    update(); //update si the shine change

    findAllLoaded = await useCase.findAll(); //store the list
    loadedCount = findAllLoaded.length; //store the amounts of tiles

    await Future.delayed(const Duration(milliseconds: 3000));

    refreshController.refreshCompleted();
    update(); //actualiza con la lista de verdad
  }

  /// The function to execute when the user load the app.
  @override
  Future<void> onLoading() async {
    await Future.delayed(const Duration(milliseconds: 250));
    refreshController.loadComplete();
  }
}
