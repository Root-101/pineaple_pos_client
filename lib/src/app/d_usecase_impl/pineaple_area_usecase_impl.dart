import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaUseCaseImpl
    extends DefaultCRUDUseCaseAsync<PineapleAreaDomain, PineapleAreaRepo>
    implements PineapleAreaUseCase {
  PineapleAreaUseCaseImpl(PineapleAreaRepo repo) : super(repo: repo);

  @override
  Future<List<PineapleAreaDomain>> findAll() async {
    return [
      PineapleAreaDomain(id: 1, name: "Área 1"),
      PineapleAreaDomain(id: 2, name: "Área 2"),
      PineapleAreaDomain(id: 3, name: "Área 3"),
      PineapleAreaDomain(id: 4, name: "Área 4"),
    ];
  }
}
