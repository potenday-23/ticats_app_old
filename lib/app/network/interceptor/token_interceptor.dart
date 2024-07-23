import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/app/util/jwt_decode.dart';

import 'package:ticats/data/index.dart';
import 'package:ticats/domain/index.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  TokenInterceptor(this._ref);

  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();
  final ProviderRef _ref;

  final _authHeaderKey = 'Authorization';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    MemberResponse? memberInfo = _ref.read(authServiceProvider).value?.memberInfo;
    memberInfo ??= await _authLocalDataSource.readMember();

    try {
      if (memberInfo != null && options.headers['withToken'] != 'false') {
        if (kDebugMode) print('onRequest TokenInterceptor ${options.uri}');

        options.headers[_authHeaderKey] = memberInfo.accessToken;
      }
      options.headers.remove('withToken');

      handler.next(options);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    MemberResponse? memberInfo = _ref.read(authServiceProvider).value?.memberInfo;
    memberInfo ??= await _authLocalDataSource.readMember();

    if (memberInfo == null || err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    if (kDebugMode) {
      print('onError TokenInterceptor ${err.requestOptions.uri}');
    }

    await _refreshWithUserAndRetry(err.requestOptions, handler);
  }

  Future<void> _refreshWithUserAndRetry(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      OAuthLoginEntity? oauthEntity = await _authLocalDataSource.readOAuth();

      if (oauthEntity == null) return;

      final MemberResponse response = await _ref.read(authUseCasesProvider).login.execute(oauthEntity);
      if (response.isAccessTokenExpired()) {
        await _rejectRequest(DioException(requestOptions: requestOptions), handler);
      }

      final Response newRequestResponse = await Dio().fetch(
        requestOptions..headers[_authHeaderKey] = response.accessToken,
      );

      handler.resolve(newRequestResponse);
    } on DioException catch (e) {
      await _rejectRequest(e, handler);
    } catch (e) {
      await _rejectRequest(DioException(requestOptions: requestOptions, error: e), handler);
    }
  }

  // Future<void> _refreshTokenAndRetry(
  //   Token token,
  //   RequestOptions requestOptions,
  //   ErrorInterceptorHandler handler,
  // ) async {
  //   try {
  //     final RefreshResponse tokenRefreshResponse = await _ref.read(authUseCasesProvider).refresh.execute(token.refreshToken);

  //     final Response newRequestResponse = await Dio().fetch(
  //       requestOptions..headers[_authHeaderKey] = '$_tokenType ${tokenRefreshResponse.accessToken}',
  //     );

  //     handler.resolve(newRequestResponse);
  //   } on DioException catch (e) {
  //     await _rejectRequest(e, handler);
  //   } catch (e) {
  //     await _rejectRequest(DioException(requestOptions: requestOptions, error: e), handler);
  //   }
  // }

  Future<void> _rejectRequest(DioException e, ErrorInterceptorHandler handler) async {
    EasyLoading.showToast("로그인이 만료 되었습니다.\n다시 로그인 해주세요.", toastPosition: EasyLoadingToastPosition.bottom);

    // await _ref.read(authServiceProvider.notifier).logout();
    // _ref.read(routerProvider).go(Routes.login);

    handler.reject(e);
  }
}
