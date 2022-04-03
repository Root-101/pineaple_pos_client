import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pineaple_pos_client/pineaple_exporter.dart';

import 'JSONConverter.dart';

class PineapleAreaRepoExternalImpl implements PineapleAreaRepoExternal {
  @override
  Future<List<PineapleAreaEntity>> findAll() async {
    /*await Future.delayed(const Duration(seconds: 0));
    return [
      PineapleAreaEntity(id: 1, name: "hi 1"),
      PineapleAreaEntity(id: 2, name: "hi 2"),
      PineapleAreaEntity(id: 3, name: "hi 3"),
    ];*/
    try {
      print('findAll en externo');
      String json = await http
          .read(Uri.parse("http://192.168.43.109:8080/pos/area/find_all"));
      print('json: $json');
      List<dynamic> parsedListJson = jsonDecode(json);
      print('decoded json: $parsedListJson');
      List<PineapleAreaEntity> itemsList = List<PineapleAreaEntity>.from(
          parsedListJson.map((i) => AreaJSONConverter.converter.fromJSON(i)));
      print('entity: $itemsList');

      return itemsList;
    } on Exception catch (ex) {
      print(ex);
    }
    return [];
    /*
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
    */
  }

  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<PineapleAreaEntity> create(PineapleAreaEntity newObject) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<PineapleAreaEntity> destroy(PineapleAreaEntity objectToDestroy) {
    // TODO: implement destroy
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<PineapleAreaEntity> edit(PineapleAreaEntity objectToEdit) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<PineapleAreaEntity> findBy(int keyId) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  void init() {
    // TODO: implement init
  }
}

class AreaJSONConverter extends JSONConverter<PineapleAreaEntity> {
  static final AreaJSONConverter converter = AreaJSONConverter._();

  AreaJSONConverter._();

  @override
  PineapleAreaEntity fromJSON(Map<String, dynamic> json) {
    return PineapleAreaEntity(
      id: json['idPosArea'] as int,
      name: json['namePosArea'] as String,
    );
  }

  @override
  Map<String, dynamic> toJSON(entity) {
    return {
      'idPosArea': entity.id,
      'namePosArea': entity.name,
    };
  }

  @override
  List<PineapleAreaEntity> fromJSONAll(List<Map<String, dynamic>> json) {
    throw UnimplementedError();
  }

  @override
  List<Map<String, dynamic>> toEntityAll(List<PineapleAreaEntity> entities) {
    throw UnimplementedError();
  }
}
