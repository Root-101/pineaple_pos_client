import 'package:clean_core/clean_core.dart';

class PineaplePOSDomain extends BasicDomainObject<PineaplePOSDomain> {
  @override
  int id;
  final String name;

  PineaplePOSDomain({
    required this.id,
    required this.name,
  });

  @override
  PineaplePOSDomain clone() {
    return PineaplePOSDomain(
      id: id,
      name: name,
    );
  }
}
