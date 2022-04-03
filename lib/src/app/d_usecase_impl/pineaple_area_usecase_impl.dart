import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaUseCaseImpl
    extends DefaultCRUDUseCaseAsync<PineapleAreaDomain>
    implements PineapleAreaUseCase {
  PineapleAreaUseCaseImpl(PineapleAreaRepo repo) : super(repo: repo);
}
