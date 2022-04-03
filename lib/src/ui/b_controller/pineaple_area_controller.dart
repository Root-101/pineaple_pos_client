import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

abstract class PineapleAreaController extends GetxController {
  Future<List<PineapleAreaDomain>> findAll();
  Future<PineapleAreaDomain> create(PineapleAreaDomain object);
  Future<PineapleAreaDomain> destroy(PineapleAreaDomain object);
  Future<PineapleAreaDomain> edit(PineapleAreaDomain object);
  Future<PineapleAreaDomain> findBy(int id);
  Future<int> count();
}
