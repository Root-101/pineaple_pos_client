import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';

abstract class PineaplePOSUseCase extends CRUDUseCase<PineaplePOSDomain> {
  List<PineaplePOSDomain> findByArea(int areaID);
}
