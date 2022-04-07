import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePosEntity extends BasicEntityObject {
  int id;
  final String name;
  final PineapleAreaEntity area;

  PineaplePosEntity({
    required this.id,
    required this.name,
    required this.area,
  });

  //the one to use
  PineaplePosEntity.build({
    required this.id,
    required this.name,
    required this.area,
  });
}
