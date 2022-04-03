import 'package:clean_core/clean_core.dart';

class PineapleAreaDomain extends BasicDomainObject<PineapleAreaDomain> {
  @override
  int id;
  final String name;

  PineapleAreaDomain({
    required this.id,
    required this.name,
  });

  @override
  PineapleAreaDomain clone() {
    return PineapleAreaDomain(
      id: id,
      name: name,
    );
  }
}
