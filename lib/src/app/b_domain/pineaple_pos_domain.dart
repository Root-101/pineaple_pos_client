import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineaplePOSDomain extends BasicDomainObject<PineaplePOSDomain> {
  @override
  int id;
  final String name;
  final PineapleAreaDomain area;

  PineaplePOSDomain({
    required this.id,
    required this.name,
    required this.area,
  });

  @override
  PineaplePOSDomain clone() {
    return PineaplePOSDomain(
      id: id,
      name: name,
      area: area,
    );
  }
}
