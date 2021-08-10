
import 'package:dio/dio.dart';
import 'package:getx_pattern_news/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "48fe36ecdc2e49038c2573124f82964c";

class HttpServiceImpl implements HttpService{

  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async{
    // TODO: implement getRequest

    Response response;
    try {
      response = await _dio.get("https://newsapi.org$url&apiKey=$API_KEY");
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler ) {
        print(error.message);
      },
      onRequest: (request, errorInterceptorHandler ){
        print("${request.method} | ${request.path}");
      },
      onResponse: (response, errorInterceptorHandler ){
        print("${response.statusCode} ${response.statusMessage} ${response.data}");
      }
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization" : "Bearer $API_KEY"}
    ));

    //initializeInterceptors();
  }

}