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
      PineapleAreaDomain(id: 1, name: "Lobby"),
      PineapleAreaDomain(id: 2, name: "Bar"),
      PineapleAreaDomain(id: 3, name: "Mostrador"),
      PineapleAreaDomain(id: 4, name: "Platea"),
    ];
  }

  @override
  PineapleAreaDomain findBy(int keyId) {
    return findAll().firstWhere((element) => element.id == keyId);
  }

  @override
  void init() {
    // TODO: implement init
  }
}
