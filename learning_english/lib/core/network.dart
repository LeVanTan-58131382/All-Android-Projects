import 'dart:convert';

import '../configs/business_constants.dart';
import "package:http/http.dart" as http;

class NetworkHelper {

  String accessToken = "";

  Future getToServer({required String apiUrl, required Object data}) async {
    Uri fullUrl  = Uri.parse( AppConstants.baseApiUrl + apiUrl);



  }

  Future postToServer({required String apiUrl, required Object data}) async {
    Uri fullUrl  = Uri.parse( AppConstants.baseApiUrl + apiUrl);

    http.Response response = await http.post(fullUrl, headers: _setHeaders(), body: data);

    if (response.statusCode == 200) {
      // TODO: moi thu ok

      return jsonDecode(response.body);

    } else if (response.statusCode == 422) {
      // TODO: xay ra loi validate

      return jsonDecode(response.body);

    } else {
      // TODO: mot loi nao do
      print("A network error occurred  ${response.statusCode}");
    }
  }

  _setHeaders() => {
    'Content-type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${this.accessToken}'
  };
}