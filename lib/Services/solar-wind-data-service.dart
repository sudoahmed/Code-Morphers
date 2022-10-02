import 'package:http/http.dart' as http;

import '../Models/solarwinddatamodel.dart';

Future<SolarWindDataModel> getSolarWindData() async {
  var request = http.Request(
      'GET', Uri.parse('http://20.204.58.183/api/v1/solarwind/7days'));

  http.StreamedResponse streamedResponse = await request.send();

  http.Response response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    return solarWindDataModelFromJson(response.body);
  } else {
    throw "error occured";
  }
}
