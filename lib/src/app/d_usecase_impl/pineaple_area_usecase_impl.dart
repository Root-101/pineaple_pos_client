import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaUseCaseImpl extends DefaultCRUDUseCase<PineapleAreaDomain>
    implements PineapleAreaUseCase {
  PineapleAreaUseCaseImpl(PineapleAreaRepo repo) : super(repo: repo);

  @override
  List<PineapleAreaDomain> findAll() {
    return [
      PineapleAreaDomain(id: 1, name: "Mesa 1"),
      PineapleAreaDomain(id: 2, name: "Mesa 2"),
      PineapleAreaDomain(id: 3, name: "Mesa 3"),
      PineapleAreaDomain(id: 4, name: "Mesa 4"),
      PineapleAreaDomain(id: 5, name: "Mesa 5"),
      PineapleAreaDomain(id: 6, name: "Mesa 6"),
      PineapleAreaDomain(id: 7, name: "Mesa 7"),
      PineapleAreaDomain(id: 8, name: "Mesa 8"),
      PineapleAreaDomain(id: 9, name: "Barra"),
    ];
  }
}
