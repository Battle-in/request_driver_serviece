import 'package:jaguar/jaguar.dart';
import 'package:request_driver_service/models/request.dart';

List<DriverRequest> driverRequest = [];

main() {
  final PORT = 8080;
  final server = Jaguar(port: PORT);
  final urlBase = 'request_driver/api0.1/';

  server.post('request_driver/api0.1/create', _createRequest);

  server.post('request_driver/api0.1/updateStatus', _updateStatus);

  server.get('request_driver/api0.1/getAll', _getAllRequests);
  //server.get(path, (context) => null)

  server.serve();
  print('server started at: 127.0.0.1:$PORT');
}

_updateStatus(Context context) async {
  try {
    var body = await context.bodyAsJson();
    print(body['status'].runtimeType);
    print(body['id'].runtimeType);
    driverRequest[body['id']].status = body['status'];
    return 'sucsess';
  } catch (e) {
    print(e);
    return e;
  }
}

_getAllRequests(Context context) async {
  try {
    String str = '{ "requests": [';

    for (DriverRequest request in driverRequest) {
      str += request.toString() + ',';
    }

    str += ']}';

    return str;
  } catch (e) {
    print(e);
    return (e);
  }
}

_createRequest(Context context) async {
  try {
    var body = await context.bodyAsJson();
    body['id'] = driverRequest.length;
    body['status'] = 'Не принят в работу';
    driverRequest.add(DriverRequest.fromJson(body));
    return 'sucsess';
  } catch (e) {
    print(e);
    return (e);
  }
}
