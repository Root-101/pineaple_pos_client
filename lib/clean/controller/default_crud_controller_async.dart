import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/clean/controller/crud_controller_async.dart';

abstract class DefaultCRUDControllerAsync<Domain extends BasicDomainObject,
        UseCase extends CRUDUseCaseAsync<Domain>>
    extends CRUDControllerAsync<Domain> {
  UseCase useCase;

  DefaultCRUDControllerAsync({required this.useCase});

  @override
  Future<Domain> create(Domain newObject) async {
    return await useCase.create(newObject);
  }

  @override
  Future<Domain> edit(Domain objectToEdit) async =>
      await useCase.edit(objectToEdit);

  @override
  Future<List<Domain>> findAll() async => await useCase.findAll();

  @override
  Future<Domain> findBy(int keyId) async => await useCase.findBy(keyId);

  @override
  Future<void> destroy(Domain objectToDestroy) async =>
      await useCase.destroy(objectToDestroy);

  @override
  Future<void> destroyById(int id) async => await useCase.destroyById(id);

  @override
  Future<int> count() async => await useCase.count();

  @override
  Future<void> init() async {}

  @override
  Future<void> close() async {}
}
