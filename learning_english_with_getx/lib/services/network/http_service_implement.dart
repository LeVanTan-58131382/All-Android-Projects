
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/src/response.dart' as HttpResponse;
import 'package:learning_english_with_getx/core/constants/app_contants.dart';
import 'package:learning_english_with_getx/services/network/http_service_abstract.dart';
import 'package:http/http.dart' as http;

class HttpServiceImplement extends HttpServiceAbstract
{

  String accessToken = "";

  @override
  void init() {

  }

  void setAccessToken(String accessToken)
  {
    this.accessToken = accessToken;
  }

  @override
  Future<HttpResponse.Response> getRequest({ required String url}) async {

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
  Future<HttpResponse.Response> postRequest({required String url, required Object data}) async {
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

  Future<http.StreamedResponse> postRequestWithFile({
    required String url,
    required int selectedUserTopic,
    required String word,
    required String pronounce,
    required String mean,
    required List partOfSpeechId,
    required List listImage,
    required List listExample
  }) async {

    var request = http.MultipartRequest('POST', Uri.parse(AppConstants.baseApiUrl + url),);

    request.headers['Content-type'] = 'application/json; charset=UTF-8';
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ${this.accessToken}';

    request.fields['topic_id'] = selectedUserTopic.toString();
    request.fields['word'] = word;
    request.fields['pronounce'] = pronounce;
    request.fields['mean'] = mean;
    // request.fields['part_of_speech_id'] = 1.toString();
    // request.fields['example_description'] = "ví dụ vậy";

    partOfSpeechId.asMap().forEach((index, element) {
    request.fields['part_of_speech_id[$index]'] = element.toString();
    });
    listExample.asMap().forEach((index, element) {
    request.fields['example_description[$index]'] = element.toString();
    });

    listImage.asMap().forEach((index, element) {
    request.fields['image[$index]'] = element.toString();
    //   request.files.add(
    //       http.MultipartFile.fromString("image[$index]", element)
    //   );
    });

    // request.files.add(
    //     http.MultipartFile.fromString(key, string)
    // );


    //MultipartFile.fromString(key, string)

    // request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();

    return res;

  }

  _setHeaders() => {
    'Content-type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${this.accessToken}'
  };

  // Future<Response> uploadImage( Object data, List<File> file) async {
  //   var dio = new Dio();
  //   dio.options.headers = _setHeaders();
  //   String fileName = file.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "image":
  //     await MultipartFile.fromFile(file.path, filename:fileName),
  //     "word": data["word"],
  //
  //   });
  //   var response = await dio.post(
  //     "http://192.168.1.6:8000/api/v1/vocabulary/personal-word/add",
  //     data: formData,
  //     options: Options(
  //         method: 'POST',
  //         responseType: ResponseType.json // or ResponseType.JSON
  //     )
  //   );
  //   // return response.data['id'];
  //   return response;
  // }



}