import 'package:clean_core/clean_core.dart';

class PineapleAreaEntity extends BasicEntityObject {
  int id;
  final String name;

  PineapleAreaEntity({
    required this.id,
    required this.name,
  });

  //the one to use
  PineapleAreaEntity.build({
    required this.id,
    required this.name,
  });
}
