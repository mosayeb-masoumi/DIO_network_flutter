

import 'package:dio/dio.dart';
import 'package:dio_example/core/utils/share_preference.dart';

class DioUtil{


  static Dio? _instance;
//method for getting dio instance
  static Dio? getInstance() {
    // if (_instance == null) {
    //   _instance = createDioInstance();
    // }
    _instance ??= createDioInstance();
    return _instance;
  }

  static Dio createDioInstance() {
    var dio = Dio();
    // adding interceptor
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {

      // options.headers["Authorization"] = "Bearer " + refreshToken;
      var accessToken = SharePreference.getAccessToken();
      options.headers["Authorization"] = "Bearer " + accessToken!;
      options.headers["Content-Type"] = "application/json";
      options.headers["Accept"] = "*/*";
      return handler.next(options);//modify your request
    }, onResponse: (response, handler) {
      if (response != null) {
        //on success it is getting called here
        return handler.next(response);
      } else {
        return null;
      }
    }, onError: (DioError e, handler) async {

      if (e.response != null) {
        if (e.response?.statusCode == 401) {//catch the 401 here

          //
          if(e.response!.data["otp"] !=null){
            //means get 401 when call otp login
            return handler.next(e);
          }


          dio.interceptors.requestLock.lock();
          dio.interceptors.responseLock.lock();
          RequestOptions requestOptions = e.requestOptions;

          // await refreshToken();

          var accessToken = SharePreference.getAccessToken();

          final opts = new Options(method: requestOptions.method);
          dio.options.headers["Authorization"] = "Bearer " + accessToken!;
          dio.options.headers["Content-Type"] = "application/json";
          dio.options.headers["Accept"] = "*/*";
          // dio.interceptors.requestLock.unlock();
          // dio.interceptors.responseLock.unlock();
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
      }else{
        handler.next(e);
      }

    }));
    return dio;
  }

  // static refreshToken() async {
  //
  //   var dio = DioUtil.getInstance();
  //   final String apiUrl = ("${ClientConfig.BASE_URL}api/Authentication/refresh");
  //
  //   final data = {
  //     "refreshToken": SharePreference.getAccessToken(),
  //   };
  //
  //   try {
  //     Response response = await dio!.post(apiUrl ,data: data);
  //     if (response.statusCode == 204 || response.statusCode == 200) {
  //
  //       String accessToken = response.data["token"];
  //       String refreshToken = response.data["refresh"];
  //
  //       // SharePreference.setIdToken(idToken);
  //       SharePreference.setAccessToken(accessToken);
  //       SharePreference.setRefreshToken(refreshToken);
  //
  //       print(await response.data);
  //       return "successful";
  //     } else {
  //       return "error";
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
  //       return "error";
  //     } else {
  //       return "error";
  //     }
  //   }
  //
  // }


}