import 'package:flutter/cupertino.dart';
import 'package:semaphore_iot_client/src/models/semaphore_model.dart';
import 'package:http/http.dart' show get, Response;

class SemaphoreProvider extends ChangeNotifier {
  late Response _response;
  Future<Semaphore> get fetchSemaphoreStatus async {
    _response = await get(Uri.parse("http://10.0.2.2:5000/status"));
    return semaphoreFromJson(_response.body);
  }
}