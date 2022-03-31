import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaControllerImpl extends PineapleAreaController {
  final PineapleAreaUseCase areaUseCase = Get.find<PineapleAreaUseCase>();

  @override
  List<PineapleAreaDomain> findAll() {
    return areaUseCase.findAll();
  }
}
