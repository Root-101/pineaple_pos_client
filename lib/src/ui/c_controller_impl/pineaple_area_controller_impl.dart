import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaControllerImpl extends PineapleAreaController {
  final PineapleAreaUseCase areaUseCase;

  PineapleAreaControllerImpl({required this.areaUseCase});

  @override
  List<PineapleAreaDomain> findAll() {
    return areaUseCase.findAll();
  }
}
