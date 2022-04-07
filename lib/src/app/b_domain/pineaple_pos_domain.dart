import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePosDomain extends BasicDomainObject<PineaplePosDomain> {
  @override
  int id;
  final String name;
  final PineapleAreaDomain area;

  PineaplePosDomain({
    required this.id,
    required this.name,
    required this.area,
  });

  @override
  PineaplePosDomain clone() {
    return PineaplePosDomain(
      id: id,
      name: name,
      area: area,
    );
  }
}
