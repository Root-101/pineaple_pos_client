import 'package:clean_core/clean_core.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePosUseCaseImpl
    extends DefaultCRUDUseCaseAsync<PineaplePosDomain, PineaplePosRepo>
    implements PineaplePosUseCase {
  PineaplePosUseCaseImpl(PineaplePosRepo repo) : super(repo: repo);

  @override
  Future<List<PineaplePosDomain>> findAll() async {
    List<PineapleAreaDomain> areaList =
        await Get.find<PineapleAreaUseCase>().findAll();
    return [
      PineaplePosDomain(id: 1, name: "Mesa 1", area: areaList.elementAt(0)),
      PineaplePosDomain(id: 2, name: "Mesa 2", area: areaList.elementAt(0)),
      PineaplePosDomain(id: 3, name: "Mesa 3", area: areaList.elementAt(0)),
      PineaplePosDomain(id: 4, name: "Mesa 4", area: areaList.elementAt(0)),
      PineaplePosDomain(id: 5, name: "Barra", area: areaList.elementAt(1)),
      PineaplePosDomain(id: 6, name: "Caja 1", area: areaList.elementAt(2)),
      PineaplePosDomain(id: 7, name: "Caja 2", area: areaList.elementAt(2)),
      PineaplePosDomain(id: 8, name: "Mesa 1", area: areaList.elementAt(3)),
      PineaplePosDomain(id: 9, name: "Mesa 2", area: areaList.elementAt(3)),
      PineaplePosDomain(id: 10, name: "Mesa 3", area: areaList.elementAt(3)),
      PineaplePosDomain(id: 11, name: "Mesa 4", area: areaList.elementAt(3)),
      PineaplePosDomain(id: 12, name: "Mesa 5", area: areaList.elementAt(3)),
    ];
  }

  @override
  Future<List<PineaplePosDomain>> findByArea(
      PineapleAreaDomain areaDomain) async {
    return findByAreaId(areaDomain.id);
  }

  @override
  Future<List<PineaplePosDomain>> findByAreaId(int areaID) async {
    return findByAreaIdCache(await findAll(), areaID);
  }

  @override
  List<PineaplePosDomain> findByAreaCache(
      List<PineaplePosDomain> posList, PineapleAreaDomain areaDomain) {
    return findByAreaIdCache(posList, areaDomain.id);
  }

  @override
  List<PineaplePosDomain> findByAreaIdCache(
      List<PineaplePosDomain> posList, int areaId) {
    return posList.where((element) => element.area.id == areaId).toList();
  }
}
