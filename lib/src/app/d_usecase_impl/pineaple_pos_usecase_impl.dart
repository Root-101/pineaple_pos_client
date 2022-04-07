import 'package:pineaple_pos_client/clean/controller/clean_controller_exporter.dart';
import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';

class PineaplePOSUseCaseImpl extends DefaultCRUDUseCase implements PineaplePOSUseCase {

  PineaplePOSUseCaseImpl({
  });

  @override
  List<PineaplePosDomain> findAll() {
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
  List<PineaplePosDomain> findByArea(int areaID) {
    return findAll().where((element) => element.area.id == areaID).toList();
  }
}
