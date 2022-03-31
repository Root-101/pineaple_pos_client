import 'package:pineaple_pos_client/src/app/b_domain/pineaple_area_domain.dart';
import 'package:pineaple_pos_client/src/app/c_usecase_def/pineaple_area_usecase.dart';

class PineapleAreaUseCaseImpl implements PineapleAreaUseCase {
  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
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
      PineapleAreaDomain(id: 1, name: "Mesa 1"),
      PineapleAreaDomain(id: 2, name: "Mesa 2"),
      PineapleAreaDomain(id: 3, name: "Mesa 3"),
      PineapleAreaDomain(id: 4, name: "Mesa 4"),
      PineapleAreaDomain(id: 5, name: "Mesa 5"),
      PineapleAreaDomain(id: 6, name: "Mesa 6"),
      PineapleAreaDomain(id: 7, name: "Mesa 7"),
      PineapleAreaDomain(id: 8, name: "Mesa 8"),
      PineapleAreaDomain(id: 9, name: "Barra"),
    ];
  }

  @override
  PineapleAreaDomain findBy(int keyId) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
