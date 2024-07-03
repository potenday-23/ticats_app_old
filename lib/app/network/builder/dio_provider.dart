import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticats/app/index.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  const Duration connectionTimeOutMls = Duration(milliseconds: 10000);
  const Duration readTimeOutMls = Duration(milliseconds: 10000);
  const Duration writeTimeOutMls = Duration(milliseconds: 10000);

  final Dio dio = Dio();

  dio.options = BaseOptions(
    responseType: ResponseType.json,
    baseUrl: AppConst.baseUrl,
    contentType: Headers.jsonContentType,
    connectTimeout: connectionTimeOutMls,
    receiveTimeout: readTimeOutMls,
    sendTimeout: writeTimeOutMls,
  );

  // Add interceptor for token handling
  // dio.interceptors.add(TokenInterceptor(ref));

  // Add interceptor for error handling
  dio.interceptors.add(ErrorInterceptor());

  return dio;
}
