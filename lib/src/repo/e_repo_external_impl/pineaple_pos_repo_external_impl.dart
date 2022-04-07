import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/clean/rest/consume_rest_crud_template.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePosExternalImpl extends ConsumeRESTCRUDTemplate<PineaplePosEntity>
    implements PineaplePosRepoExternal {
  PineaplePosExternalImpl()
      : super(
          urlGeneral: "http://10.0.2.2:8080/pos/pos",
          converter: PosJSONConverter.converter,
        );
}

class PosJSONConverter extends JSONConverter<PineaplePosEntity> {
  static final PosJSONConverter converter = PosJSONConverter._();

  PosJSONConverter._();

  @override
  PineaplePosEntity fromJSONMap(Map<String, dynamic> json) {
    return PineaplePosEntity(
      id: json['1'] as int,
      name: json['1'] as String,
      area: AreaJSONConverter.converter.fromJSONMap(json['3']),
    );
  }

  @override
  Map<String, dynamic> toJSONMap(PineaplePosEntity entity) {
    return {
      '1': entity.id,
      '2': entity.name,
      '3': AreaJSONConverter.converter.toJSONString(entity.area),
      '4': 'no description provider',
    };
  }
}
