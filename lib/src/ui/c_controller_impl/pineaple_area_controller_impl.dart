import 'package:pineaple_pos_client/pineaple_exporter.dart';

class PineapleAreaControllerImpl extends PineapleAreaController {
  final PineapleAreaUseCase areaUseCase;

  PineapleAreaControllerImpl({required this.areaUseCase});

  @override
  Future<List<PineapleAreaDomain>> findAll() async {
    return await areaUseCase.findAll();
  }

  Future<PineapleAreaDomain> create(PineapleAreaDomain object) async {
    return await areaUseCase.create(object);
  }

  Future<PineapleAreaDomain> destroy(PineapleAreaDomain object) async {
    return await areaUseCase.destroy(object);
  }

  Future<PineapleAreaDomain> edit(PineapleAreaDomain object) async {
    return await areaUseCase.edit(object);
  }

  Future<PineapleAreaDomain> findBy(int id) async {
    return await areaUseCase.findBy(id);
  }

  Future<int> count() async {
    return await areaUseCase.count();
  }
}
