import 'package:dio/dio.dart';

String getMessageFromDioEx(DioError ex) {
  String msg;
  if (ex.response != null) {
    msg = ex.response.data['error_message'];
  } else {
    msg = ex.error.message;
  }
  return msg;
}
