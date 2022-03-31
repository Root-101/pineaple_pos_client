import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleCoreModule {
  static Future init() async {
    Get.put<PineapleAreaUseCase>(PineapleAreaUseCaseImpl());
  }
}
