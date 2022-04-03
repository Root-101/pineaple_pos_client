import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';

class PineaplePOSUseCaseImpl implements PineaplePOSUseCase {
  /// List with all the areas.
  List<PineapleAreaDomain> areaList;

  PineaplePOSUseCaseImpl({
    required this.areaList,
  });

  @override
  int count() {
    return findAll().length;
  }

  @override
  PineaplePOSDomain create(PineaplePOSDomain newObject) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  PineaplePOSDomain destroy(PineaplePOSDomain objectToDestroy) {
    // TODO: implement destroy
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  PineaplePOSDomain edit(PineaplePOSDomain objectToEdit) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  List<PineaplePOSDomain> findAll() {
    return [
      PineaplePOSDomain(id: 1, name: "Mesa 1", area: areaList.elementAt(0)),
      PineaplePOSDomain(id: 2, name: "Mesa 2", area: areaList.elementAt(0)),
      PineaplePOSDomain(id: 3, name: "Mesa 3", area: areaList.elementAt(0)),
      PineaplePOSDomain(id: 4, name: "Mesa 4", area: areaList.elementAt(0)),
      PineaplePOSDomain(id: 5, name: "Barra", area: areaList.elementAt(1)),
      PineaplePOSDomain(id: 6, name: "Caja 1", area: areaList.elementAt(2)),
      PineaplePOSDomain(id: 7, name: "Caja 2", area: areaList.elementAt(2)),
      PineaplePOSDomain(id: 8, name: "Mesa 1", area: areaList.elementAt(3)),
      PineaplePOSDomain(id: 9, name: "Mesa 2", area: areaList.elementAt(3)),
      PineaplePOSDomain(id: 10, name: "Mesa 3", area: areaList.elementAt(3)),
      PineaplePOSDomain(id: 11, name: "Mesa 4", area: areaList.elementAt(3)),
      PineaplePOSDomain(id: 12, name: "Mesa 5", area: areaList.elementAt(3)),
    ];
  }

  @override
  PineaplePOSDomain findBy(int keyId) {
    return findAll().firstWhere((element) => element.id == keyId);
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  List<PineaplePOSDomain> findByArea(int areaID) {
    return findAll().where((element) => element.area.id == areaID).toList();
  }
}
