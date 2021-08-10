import 'package:http/http.dart';

abstract class HttpServiceAbstract
{
  void init();

  Future<Response> getRequest({ required String url});
  Future<Response> postRequest({ required String url, required Object data});
}