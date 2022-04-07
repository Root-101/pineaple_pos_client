import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleRepoModule {
  static Future<bool> init() async {
    Get.put<PineapleAreaRepo>(
      PineapleAreaRepoImpl(repoExternal: PineapleAreaRepoExternalImpl()),
    );
    Get.put<PineaplePosRepo>(
      PineaplePosRepoImpl(repoExternal: PineaplePosExternalImpl()),
    );
    return true;
  }
}
