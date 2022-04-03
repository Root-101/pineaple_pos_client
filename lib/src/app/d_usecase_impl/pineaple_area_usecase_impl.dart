import 'package:pineaple_pos_client/src/app/b_domain/pineaple_domain_exporter.dart';
import 'package:pineaple_pos_client/src/app/c_usecase_def/pineaple_area_usecase.dart';

class PineapleAreaUseCaseImpl implements PineapleAreaUseCase {
  @override
  int count() {
    return findAll().length;
  }

  @override
  PineapleAreaDomain create(PineapleAreaDomain newObject) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  PineapleAreaDomain destroy(PineapleAreaDomain objectToDestroy) {
    // TODO: implement destroy
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  PineapleAreaDomain edit(PineapleAreaDomain objectToEdit) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  List<PineapleAreaDomain> findAll() {
    return [
      PineapleAreaDomain(id: 1, name: "Lobby", posList: [
        PineaplePOSDomain(id: 1, name: "Mesa 1"),
        PineaplePOSDomain(id: 2, name: "Mesa 2"),
        PineaplePOSDomain(id: 3, name: "Mesa 3"),
        PineaplePOSDomain(id: 4, name: "Mesa 4"),
      ]),
      PineapleAreaDomain(id: 2, name: "Bar", posList: [
        PineaplePOSDomain(id: 5, name: "Barra"),
      ]),
      PineapleAreaDomain(id: 3, name: "Mostrador", posList: [
        PineaplePOSDomain(id: 6, name: "Mesa 1"),
        PineaplePOSDomain(id: 7, name: "Mesa 2"),
      ]),
      PineapleAreaDomain(id: 4, name: "Platea", posList: [
        PineaplePOSDomain(id: 8, name: "Mesa 1"),
        PineaplePOSDomain(id: 9, name: "Mesa 2"),
        PineaplePOSDomain(id: 10, name: "Mesa 3"),
        PineaplePOSDomain(id: 11, name: "Mesa 4"),
        PineaplePOSDomain(id: 12, name: "Mesa 5"),
        PineaplePOSDomain(id: 13, name: "Mesa 6"),
      ]),
    ];
  }

  @override
  PineapleAreaDomain findBy(int keyId) {
    return findAll().firstWhere((element) => element.id == keyId);
  }

  @override
  List<PineaplePOSDomain> posList(int areaID) {
    return findBy(areaID).posList;
  }

  @override
  void init() {
    // TODO: implement init
  }
}
