import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

abstract class PineapleAreaController extends GetxController {
  List<PineapleAreaDomain> findAll();
}
