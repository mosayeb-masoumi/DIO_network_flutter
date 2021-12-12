import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_network/constant.dart';
import 'package:dio_network/share_pref.dart';

class DioUtil {
  static Dio? _instance;
//method for getting dio instance
  static Dio? getInstance() {
    if (_instance == null) {
      _instance = createDioInstance();
    }
    return _instance;
  }

  static Dio createDioInstance() {
    var dio = Dio();
    // adding interceptor
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {

      // options.headers["Authorization"] = "Bearer " + refreshToken;
      var refreshToken = SharePrefs.getRefreshToken();
      options.headers["Authorization"] = "Bearer " + refreshToken!;
      options.headers["Accept"] = "application/json";
      return handler.next(options);//modify your request
    }, onResponse: (response, handler) {
      if (response != null) {//on success it is getting called here
        return handler.next(response);
      } else {
        return null;
      }
    }, onError: (DioError e, handler) async {

      if (e.response != null) {
        if (e.response?.statusCode == 401) {//catch the 401 here
          dio.interceptors.requestLock.lock();
          dio.interceptors.responseLock.lock();
          RequestOptions requestOptions = e.requestOptions;

          await refreshToken();
          // Repository repository = Repository();
          // var accessToken = await repository.readData("accessToken");
          var accessToken = SharePrefs.getAccessToken();

          final opts = new Options(method: requestOptions.method);
          dio.options.headers["Authorization"] = "Bearer " + accessToken!;
          dio.options.headers["Accept"] = "application/json";
          // dio.options.headers["Accept"] = "*/*";
          dio.interceptors.requestLock.unlock();
          dio.interceptors.responseLock.unlock();
          final response = await dio.request(requestOptions.path,
              options: opts,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
          if (response != null) {
            handler.resolve(response);
          } else {
            return null;
          }
        } else {
          handler.next(e);
        }
      }

    }));
    return dio;
  }

  static refreshToken() async {
    Response response;
    // Repository repository = Repository();
    var dio = Dio();
    final Uri apiUrl = Uri.parse(Constant.BASE_PATH + "auth/reIssueAccessToken");
    // var refreshToken = await repository.readData("refreshToken");
    var refreshToken = SharePrefs.getRefreshToken();
    dio.options.headers["Authorization"] = "Bearer " + refreshToken!;
    try {
      response = await dio.postUri(apiUrl);
      if (response.statusCode == 200) {

        // RefreshTokenResponse refreshTokenResponse =
        // RefreshTokenResponse.fromJson(jsonDecode(response.toString()));
        // repository.addValue('accessToken', refreshTokenResponse.data.accessToken);
        // repository.addValue('refreshToken', refreshTokenResponse.data.refreshToken);

/********** save refresh token and token ****/

      } else {
        print(response.toString()); //TODO: logout
      }
    } catch (e) {
      print(e.toString()); //TODO: logout
    }
  }
}