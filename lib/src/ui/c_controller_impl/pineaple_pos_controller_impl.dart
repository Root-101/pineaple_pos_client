import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePOSControllerImpl extends PineaplePOSController {
  late final PineaplePOSUseCase posUseCase;

  PineaplePOSControllerImpl({
    required List<PineapleAreaDomain> areaList,
  }) : posUseCase = PineaplePOSUseCaseImpl(areaList: areaList);
}
