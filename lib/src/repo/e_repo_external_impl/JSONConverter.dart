import 'package:clean_core/clean_core.dart';

abstract class JSONConverter<Entity extends BasicEntityObject> {
  ///Convert JSON into entity.
  Entity fromJSON(Map<String, dynamic> json);

  ///Convert entity into JSON.
  Map<String, dynamic> toJSON(Entity entity);

  ///Convert a JSON into a list of entities.
  List<Entity> fromJSONAll(List<Map<String, dynamic>> json);

  ///Convert a list of entities into a JSON.
  List<Map<String, dynamic>> toEntityAll(List<Entity> entities);
}
