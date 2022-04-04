import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/src/ui/b_controller/abstract_controller.dart';

abstract class CRUDControllerAsync<Domain extends BasicDomainObject>
    extends AbstractController {
  ///Create the domain.
  Future<Domain> create(Domain newObject);

  ///Edit the domain.
  Future<Domain> edit(Domain objectToEdit);

  ///Destroy the domain.
  Future<void> destroy(Domain objectToDestroy);

  ///Destroy the domain.
  Future<void> destroyById(int id);

  ///Find the correspondent domain by it's Key Id.
  Future<Domain> findBy(int keyId);

  ///Find all domains.
  Future<List<Domain>> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  Future<int> count() async {
    return findAll().then((value) => value.length);
  }

  Future<void> init();

  Future<void> close();
}
