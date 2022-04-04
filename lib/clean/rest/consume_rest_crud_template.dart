import 'package:clean_core/clean_core.dart';
import 'package:http/http.dart' as http;

class ConsumeRESTCRUDTemplate<Entity extends BasicEntityObject>
    extends CRUDRepositoryExternalAsync<Entity> {
  final String urlGeneral;
  final JSONConverter<Entity> converter;
  final Map<String, String>? _headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  ConsumeRESTCRUDTemplate({required this.urlGeneral, required this.converter});

  @override
  Future<List<Entity>> findAll() async {
    String json = await http.read(
      Uri.parse("$urlGeneral/find_all"),
      headers: _headers,
    );
    return converter.fromJSONAllString(json);
  }

  @override
  Future<Entity> findBy(int keyId) async {
    String json = await http.read(Uri.parse("$urlGeneral/find_by/$keyId"),
        headers: _headers);
    return converter.fromJSONString(json);
  }

  @override
  Future<Entity> create(Entity newObject) async {
    String body = converter.toJSONString(newObject);
    String jsonBody = (await http.post(
      Uri.parse("$urlGeneral/create"),
      body: body,
      headers: _headers,
    ))
        .body;
    return converter.fromJSONString(jsonBody);
  }

  @override
  Future<Entity> edit(Entity objectToEdit) async {
    String body = converter.toJSONString(objectToEdit);
    String jsonBody = (await http.post(
      Uri.parse("$urlGeneral/edit"),
      body: body,
      headers: _headers,
    ))
        .body;
    return converter.fromJSONString(jsonBody);
  }

  @override
  Future<void> destroy(Entity objectToDestroy) async {
    String body = converter.toJSONString(objectToDestroy);
    await http.post(
      Uri.parse("$urlGeneral/destroy"),
      body: body,
      headers: _headers,
    );
  }

  @override
  Future<void> destroyById(int id) async {
    await http.post(
      Uri.parse("$urlGeneral/destroy_id"),
      body: "$id",
      headers: _headers,
    );
  }

  @override
  Future<int> count() async {
    String json =
        await http.read(Uri.parse("$urlGeneral/count"), headers: _headers);
    return int.parse(json);
  }
}
