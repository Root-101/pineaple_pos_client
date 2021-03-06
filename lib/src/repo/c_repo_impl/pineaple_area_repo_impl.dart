import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaRepoImpl extends DefaultCRUDRepoAsync<PineapleAreaDomain,
    PineapleAreaEntity, PineapleAreaRepoExternal> implements PineapleAreaRepo {
  PineapleAreaRepoImpl({required PineapleAreaRepoExternal repoExternal})
      : super(
            externalRepo: repoExternal,
            converter: PineapleAreaConverter.converter);
}

class PineapleAreaConverter
    extends GeneralConverter<PineapleAreaDomain, PineapleAreaEntity> {
  static final PineapleAreaConverter converter = PineapleAreaConverter._();

  PineapleAreaConverter._();

  @override
  PineapleAreaDomain toDomain(PineapleAreaEntity entity) {
    return PineapleAreaDomain(
      id: entity.id,
      name: entity.name,
    );
  }

  @override
  PineapleAreaEntity toEntity(PineapleAreaDomain domain) {
    return PineapleAreaEntity.build(id: domain.id, name: domain.name);
  }
}
