import 'dart:io';

import 'package:http/src/response.dart';
import 'package:learning_english_with_getx/core/constants/app_contants.dart';
import 'package:learning_english_with_getx/services/network/http_service_abstract.dart';
import 'package:http/http.dart' as http;

class HttpServiceImplement extends HttpServiceAbstract
{

  late String accessToken;

  @override
  void init() {
    this.accessToken = "";
  }

  @override
  Future<Response> getRequest({ required String url}) async {

    http.Response response;
    Uri fullUrl  = Uri.parse( AppConstants.baseApiUrl + url);

    try {

      response = await http.get(fullUrl, headers: _setHeaders());

    } on HttpException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> postRequest({required String url, required Object data}) async {
    // TODO: implement postRequest

    http.Response response;
    Uri fullUrl  = Uri.parse( AppConstants.baseApiUrl + url);

    try {

      response = await http.post(fullUrl, headers: _setHeaders(), body: data);

    } on HttpException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  _setHeaders() => {
    'Content-type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${this.accessToken}'
  };

}