import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaRepoImpl
    extends DefaultCRUDRepo<PineapleAreaDomain, PineapleAreaEntity>
    implements PineapleAreaRepo {
  PineapleAreaRepoExternal _externalRepo;

  PineapleAreaRepoImpl({required PineapleAreaRepoExternal repoExternal})
      : _externalRepo = repoExternal,
        super(
            externalRepo: repoExternal,
            converter: PineapleAreaConverter.converter);
}

class PineapleAreaConverter
    extends DefaultGeneralConverter<PineapleAreaDomain, PineapleAreaEntity> {
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
