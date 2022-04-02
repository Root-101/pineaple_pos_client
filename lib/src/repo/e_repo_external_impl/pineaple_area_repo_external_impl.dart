import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaRepoExternalImpl implements PineapleAreaRepoExternal {
  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  PineapleAreaEntity create(PineapleAreaEntity newObject) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  PineapleAreaEntity destroy(PineapleAreaEntity objectToDestroy) {
    // TODO: implement destroy
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  PineapleAreaEntity edit(PineapleAreaEntity objectToEdit) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  List<PineapleAreaEntity> findAll() {
    return [
      PineapleAreaEntity.build(id: 1, name: "Mesa 1"),
      PineapleAreaEntity.build(id: 2, name: "Mesa 2"),
      PineapleAreaEntity.build(id: 3, name: "Mesa 3"),
      PineapleAreaEntity.build(id: 4, name: "Mesa 4"),
      PineapleAreaEntity.build(id: 5, name: "Mesa 5"),
      PineapleAreaEntity.build(id: 6, name: "Mesa 6"),
      PineapleAreaEntity.build(id: 7, name: "Mesa 7"),
      PineapleAreaEntity.build(id: 8, name: "Mesa 8"),
    ];
  }

  @override
  PineapleAreaEntity findBy(int keyId) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
