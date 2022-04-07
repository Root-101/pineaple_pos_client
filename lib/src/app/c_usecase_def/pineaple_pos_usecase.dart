import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';

abstract class PineaplePOSUseCase extends CRUDUseCaseAsync<PineaplePosDomain> {
  Future<List<PineaplePosDomain>> findByAreaId(int areaId);

  Future<List<PineaplePosDomain>> findByArea(PineapleAreaDomain areaDomain);

  List<PineaplePosDomain> findByAreaCache(
      List<PineaplePosDomain> poslist, PineapleAreaDomain areaDomain);

  List<PineaplePosDomain> findByAreaIdCache(
      List<PineaplePosDomain> poslist, int areaId);
}
