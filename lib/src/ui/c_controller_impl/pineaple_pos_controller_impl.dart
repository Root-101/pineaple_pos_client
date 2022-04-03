import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePOSControllerImpl extends PineaplePOSController {
  final PineaplePOSUseCase posUseCase = Get.find<PineaplePOSUseCase>();
}
