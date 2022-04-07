import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePosRepoImpl extends DefaultCRUDRepoAsync<PineaplePosDomain,
    PineaplePosEntity, PineaplePosRepoExternal> implements PineaplePosRepo {
  PineaplePosRepoImpl({required PineaplePosRepoExternal repoExternal})
      : super(
          externalRepo: repoExternal,
          converter: PineaplePosConverter.converter,
        );
}

class PineaplePosConverter
    extends GeneralConverter<PineaplePosDomain, PineaplePosEntity> {
  static final PineaplePosConverter converter = PineaplePosConverter._();

  PineaplePosConverter._();

  @override
  PineaplePosDomain toDomain(PineaplePosEntity entity) {
    return PineaplePosDomain(
      id: entity.id,
      name: entity.name,
      area: PineapleAreaConverter.converter.toDomain(entity.area),
    );
  }

  @override
  PineaplePosEntity toEntity(PineaplePosDomain domain) {
    return PineaplePosEntity.build(
      id: domain.id,
      name: domain.name,
      area: PineapleAreaConverter.converter.toEntity(domain.area),
    );
  }
}
