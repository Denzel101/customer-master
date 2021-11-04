// import 'dart:convert';
import 'package:dio/dio.dart';

buildErrorResponse(e, response) {
  response['error'] = true;

  if (e.response != null) {
    Map errorData = e.response.data;

    response['errorMsg'] = errorData['message'];
    response['errorData'] = errorData['data']['data'];
  } else {
    response['errorMsg'] = e.message;
  }

  return response;
}

extension DioRequest on Dio {
  makeRequest(String type, String url, data) async {
    print('Called request called: $type');
    Map<String, dynamic> response = {
      'error': false,
      'errorMsg': '',
      'errorData': null,
      'response': null
    };

    switch (type) {
      case 'get':
        try {
          Response apiResponse = await this.get(url);
          response['response'] = apiResponse;
          // response['response'] = apiResponse.data['data'];
          // print('Response from the servers: ${apiResponse.data['data']}');
        } on DioError catch (e) {
          response = buildErrorResponse(e, response);
          // print('An error occurred: $response');
        }
        break;
      case 'post':
        try {
          Response apiResponse = await this.post(url, data: data);
          response['response'] = apiResponse;
          // print('Response from the servers: ${apiResponse.data['data']}');
        } on DioError catch (e) {
          response = buildErrorResponse(e, response);
          // print('An error occurred: $response');
        }
        break;
      default:
        print('The method $type is not supported');
    }

    // print('Here is the response: $response');
    return response;
  }
}

String baseURL = 'https://ezdan-service-pap-development.herokuapp.com/api/v1';
BaseOptions options = BaseOptions(
  baseUrl: baseURL,
);
Dio instance = Dio(options);

void init() {
  instance.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      //TODO add the auth token here
      return options;
    },
  ));
}

get(String url) {
  return instance.makeRequest('get', url, {});
}

post(String url, Map data) {
  return instance.makeRequest('post', url, data);
}
