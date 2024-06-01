import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ErrorInterceptor extends QueuedInterceptor {
  ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) print('onError ErrorInterceptor ${err.requestOptions.uri}');

    EasyLoading.showToast("Error: ${err.response!.data}", toastPosition: EasyLoadingToastPosition.bottom);

    handler.next(err);
  }
}
