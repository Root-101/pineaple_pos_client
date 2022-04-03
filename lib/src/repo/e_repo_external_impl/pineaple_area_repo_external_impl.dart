import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

import 'consume_rest_crud_template.dart';

class PineapleAreaRepoExternalImpl
    extends ConsumeRESTCRUDTemplate<PineapleAreaEntity>
    implements PineapleAreaRepoExternal {
  PineapleAreaRepoExternalImpl()
      : super(
          urlGeneral: "http://10.0.2.2:8080/pos/area",
          converter: AreaJSONConverter.converter,
        );
}

class AreaJSONConverter extends JSONConverter<PineapleAreaEntity> {
  static final AreaJSONConverter converter = AreaJSONConverter._();

  AreaJSONConverter._();

  @override
  PineapleAreaEntity fromJSONMap(Map<String, dynamic> json) {
    return PineapleAreaEntity(
      id: json['idPosArea'] as int,
      name: json['namePosArea'] as String,
    );
  }

  @override
  Map<String, dynamic> toJSONMap(PineapleAreaEntity entity) {
    return {
      'idPosArea': entity.id,
      'namePosArea': entity.name,
      'descriptionPosArea': 'no description provider',
    };
  }
}
