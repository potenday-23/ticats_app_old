import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/data/index.dart';
import 'package:ticats/domain/index.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: "${AppConst.baseUrl}/members")
abstract class AuthAPI {
  factory AuthAPI(Dio dioBuilder) = _AuthAPI;

  @GET("/me")
  Future<MemberResponseModel> getMe();

  @POST("/nickname-validation")
  @Headers({'showError': "false"})
  Future<void> getNickValid(@Body() Map<String, String> request);

  @POST("/login")
  Future<MemberResponseModel> login(@Body() OAuthLoginEntity oauthLogin);

  @POST("/fcm-token")
  @Headers({'showError': "false"})
  Future<void> setFCMToken(@Body() Map<String, String> request);

  @POST("/info")
  Future<MemberResponseModel> setUserInfo(@Body() MemberInfoEntity memberInfo);
}
