import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleCoreModule {
  static Future<bool> init() async {
    await PineapleRepoModule.init();

    Get.put<PineapleAreaUseCase>(
      PineapleAreaUseCaseImpl(
        Get.find<PineapleAreaRepo>(),
      ),
    );
    return true;
  }
}
