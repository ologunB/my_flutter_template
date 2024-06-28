import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../models/login_response.dart';
import '../storage/local_storage.dart';

export 'dart:io';

export 'package:dio/dio.dart';

export '../models/custom_exception.dart';
export '../models/error_util.dart';
export '../models/login_response.dart';
export '../storage/local_storage.dart';

class BaseAPI {
  Dio dio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'baseUrl',
        sendTimeout: const Duration(seconds: 50),
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
        contentType: 'application/json',
        validateStatus: (int? s) => s! < 500,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          String? token = AppCache.getUser()?.tokens?.access?.token;
          req.headers['Authorization'] = 'Bearer $token';
          req.headers['x-app-token'] = 'qPe16CwiGc8U4eRuPPXWN8mv4uP6pHy8';
          return handler.next(req);
        },
        onResponse: (res, handler) async {
          print(res.statusCode);
          if (res.statusCode == 503 ||
              (res.statusCode == 401 &&
                  (res.data['message'] == 'authentication failed' ||
                      res.data['message'] ==
                          'Bad/expired authorisation token' ||
                      res.data['message'] == 'Invalid authorization token') &&
                  AppCache.getUser()?.tokens?.access?.token != null)) {
            try {
              await refreshToken();
            } catch (e) {
              return handler.next(res);
            }
            return handler.resolve(await _retry(res.requestOptions));
          }

          return handler.next(res);
        },
      ),
    );

    return dio;
  }

  Future<void> refreshToken() async {
    String url = 'users/v1/auth/refresh-tokens';
    try {
      final Response<dynamic> res = await Dio().post<dynamic>(url,
          data: {'refreshToken': AppCache.getUser()?.tokens?.refresh?.token});
      switch (res.statusCode) {
        case 200:
          AppCache.setUser(LoginResponse.fromJson(res.data));
          break;
        default:
          throw 'Please login again';
      }
    } catch (ex) {
      AppCache.clear();
      log(ex);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    Map<String, dynamic> headers = requestOptions.headers;
    headers['Authorization'] =
        'Bearer ${AppCache.getUser()?.tokens?.access?.token}';
    final options = Options(
      method: requestOptions.method,
      headers: headers,
    );
    return dio().request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  log(dynamic data) {
    Logger l = Logger();
    l.d(data);
  }

  String error(dynamic data) {
    print(data);
    if (data?['errors'] == null) {
      return data?['message'] ?? 'An error occurred';
    } else {
      return data['errors']
          .values
          .join('\n')
          .replaceAll('[', '')
          .replaceAll(']', '');
    }
  }
}
