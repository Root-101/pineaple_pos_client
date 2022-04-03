import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/src/app/pineaple_app_exporter.dart';

class PineapleAreaDomain extends BasicDomainObject<PineapleAreaDomain> {
  @override
  int id;
  final String name;
  final List<PineaplePOSDomain> posList;

  PineapleAreaDomain({
    required this.id,
    required this.name,
    required this.posList,
  });

  @override
  PineapleAreaDomain clone() {
    return PineapleAreaDomain(
      id: id,
      name: name,
      posList: posList,
    );
  }
}
