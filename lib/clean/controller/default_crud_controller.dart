import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/clean/controller/crud_controller.dart';

abstract class DefaultCRUDUseCase<Domain extends BasicDomainObject,
    UseCase extends CRUDUseCase<Domain>> extends CRUDController<Domain> {
  UseCase useCase;

  DefaultCRUDUseCase({required this.useCase});

  @override
  Domain create(Domain newObject) {
    return useCase.create(newObject);
  }

  @override
  Domain edit(Domain objectToEdit) => useCase.edit(objectToEdit);

  @override
  List<Domain> findAll() => useCase.findAll();

  @override
  Domain findBy(int keyId) => useCase.findBy(keyId);

  @override
  void destroy(Domain objectToDestroy) => useCase.destroy(objectToDestroy);

  @override
  void destroyById(int id) => useCase.destroyById(id);

  @override
  int count() => useCase.count();

  @override
  void init() {}

  @override
  void close() {}
}
