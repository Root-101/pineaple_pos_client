import 'package:clean_core/clean_core.dart';
import 'package:pineaple_pos_client/src/ui/b_controller/abstract_controller.dart';

abstract class CRUDController<Domain extends BasicDomainObject>
    extends AbstractController {
  ///Create the domain.
  Domain create(Domain newObject);

  ///Edit the domain.
  Domain edit(Domain objectToEdit);

  ///Destroy the domain.
  void destroy(Domain objectToDestroy);

  ///Destroy the domain.
  void destroyById(int id);

  ///Find the correspondent domain by it's Key Id.
  Domain findBy(int keyId);

  ///Find all domains.
  List<Domain> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }

  void init();

  void close();
}
