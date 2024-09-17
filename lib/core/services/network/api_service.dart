import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:evoltsoft/core/index.dart';
import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';

import 'custom_interceptors.dart';
import 'error_model.dart';
import 'status_codes.dart';

/// callback [OnSuccess] of Api success response
typedef OnSuccess = Function(dynamic data);

/// callback [OnError] of Api error response
typedef OnError = Function(ErrorModel error);

typedef ProgressCount = void Function(int count, int total);

/// [ApiService] class is a singleton class to perform all type of requests and get results using [Dio] package
class ApiService {
  static ApiService? _singleton;
  static final Lock _lock = Lock();

  /// declaration of [Dio] instance
  static final Dio _dio = Dio();

  static Dio get dio => _dio;

  static Future<ApiService> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(
        () async {
          if (_singleton == null) {
            // keep local instance till it is fully initialized.
            var singleton = ApiService._();
            await singleton._init();
            _singleton = singleton;
          }
        },
      );
    }
    return _singleton!;
  }

  ApiService._();

  /// by calling [init] method [_dio] will be initialised with default configurations
  Future<void> _init() async {
    ///base url will be configured here
    _dio.options.baseUrl = "";
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.validateStatus = (status) {
      return status != null ? status < 500 : false;
    };
    if (kDebugMode) {
      _dio.interceptors.add(
        CustomInterceptor(
          responseHeader: true,
          request: true,
          requestHeader: true,
          requestBody: true,
          error: true,
          compact: true,
          responseBody: true,
        ),
      );
    }
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: (message) {
        LogUtils.d(message, name: '');
      },
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
      ],
    ));
  }

  static Future<Map<String, dynamic>> getAuthHeader() async {
    return {
      // "Authorization": await UserPreference.getHeader(),
      // "Content-Type": "application/json",
    };
  }

  /// by calling [postRequest] and passing arguments we can perform POST request
  /// Ex. :
  /// [url] : without base url like "/users"
  /// [header] : argument defines the current request contains custom headers or not
  /// [onSuccess] : this callback will give the success response from the api
  /// [onError] : this callback will return the error with code & message so we can display on Ui thread accordingly
  static Future<void> postRequest({
    required String url,
    String? authToken,
    Map? data,
    Map<String, dynamic>? queryParameters,
    required OnSuccess onSuccess,
    required OnError onError,
    required ProgressCount progressCount,
  }) async {
    _dio.options.headers['Content-Type'] = 'application/json';
    if (authToken != null) {
      _dio.options.headers['Authorization'] = "Bearer $authToken";
    } else {
      try {
        _dio.options.headers
            .removeWhere((key, value) => key == "Authorization");
      } catch (exception) {
        LogUtils.e("postRequest > Authorization > exception :~> $exception");
      }
    }

    try {
      Response response = await _dio.post(url,
          data: data,
          // queryParameters: queryParameters,
          // options: Options(),
          onSendProgress: progressCount);
      if (isValidResponse(response)) {
        try {
          onSuccess(response.data);
        } catch (e) {
          LogUtils.e("postRequest catch exception", error: e);
          onSuccess(response.data);
          // onSuccess(response.data);
        }
      } else {
        try {
          onError(
            ErrorModel(
              code: response.statusCode,
              message: json.decode(response.data)["message"],
              action: response.data,
            ),
          );
        } catch (e) {
          LogUtils.e("postRequest catch exception", error: e);
          onError(
            ErrorModel(
              code: response.statusCode,
              message: response.data["message"],
              action: response.data,
            ),
          );
        }
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(
        ErrorModel(
          code: 400,
          message: error.message,
        ),
      );
    } on SocketException catch (error) {
      onError(
        ErrorModel(
          code: 502,
          message: error.message,
        ),
      );
    } /* on BaseException catch (error) {
      onError(
        ErrorModel(
          code: error.code,
          message: error.message,
        ),
      );
    }*/
  }

  /// by calling [putRequest] and passing arguments we can perform PUT request
  /// Ex. :
  /// [url] : without base url like "/users"
  /// [header] : argument defines the current request contains custom headers or not
  /// [onSuccess] : this callback will give the success response from the api
  /// [onError] : this callback will return the error with code & message so we can display on Ui thread accordingly
  static Future<void> putRequest({
    required String url,
    String? authToken,
    Map? data,
    Map<String, dynamic>? queryParameters,
    required OnSuccess onSuccess,
    required OnError onError,
    required ProgressCount progressCount,
  }) async {
    log("authToken :~> $authToken");
    _dio.options.headers['Content-Type'] = 'application/json';
    if (authToken != null) {
      _dio.options.headers['Authorization'] = "Bearer $authToken";
    } else {
      try {
        _dio.options.headers
            .removeWhere((key, value) => key == "Authorization");
      } catch (exception) {
        log("putRequest > authToken else > catch > exception :~> $exception");
      }
    }
    //
    Response response =
        await _dio.put(url, data: data, onReceiveProgress: progressCount);
    try {
      if (isValidResponse(response)) {
        try {
          onSuccess(json.decode(response.data));
        } catch (e) {
          // LogUtils.e("putRequest catch exception", error: e);
          log("putRequest catch exception", error: e);

          onSuccess(response.data);
        }
      } else {
        try {
          onError(
            ErrorModel(
              code: response.statusCode,
              message: json.decode(response.data)["message"],
            ),
          );
        } catch (e) {
          LogUtils.e("putRequest catch exception", error: e);

          onError(
            ErrorModel(
              code: response.statusCode,
              message: response.statusMessage,
            ),
          );
        }
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(ErrorModel(
        code: 400,
        message: error.message,
      ));
    } on SocketException catch (error) {
      onError(ErrorModel(
        code: 502,
        message: error.message,
      ));
    } /* on BaseException catch (error) {
      onError(ErrorModel(
        code: error.code,
        message: error.message,
      ));
    }*/
  }

  /// by calling [getRequest] and passing arguments we can perform GET request
  /// Ex. :
  /// [url] : without base url like "/users"
  /// [isHeader] : argument defines the current request contains custom headers or not
  /// [onSuccess] : this callback will give the success response from the api
  /// [onError] : this callback will return the error with code & message so we can display on Ui thread accordingly
  static Future<void> getRequest({
    required String url,
    String? authToken,
    Map? data,
    Map<String, dynamic>? queryParameters,
    required OnSuccess onSuccess,
    required OnError onError,
    required ProgressCount progressCount,
  }) async {
    _dio.options.headers['Content-Type'] = 'application/json';
    if (authToken != null) {
      _dio.options.headers['Authorization'] = "Bearer $authToken";
    } else {
      try {
        _dio.options.headers
            .removeWhere((key, value) => key == "Authorization");
      } catch (exception) {
        log("postRequest > Authorization > exception :~> $exception");
      }
    }

    Response response = await _dio.get(url,
        data: data,
        // queryParameters: queryParameters,
        onReceiveProgress: progressCount);
    try {
      // if (isValidResponse(response)) {
      if (null != response.data) {
        try {
          onSuccess(json.decode(response.data));
        } catch (e) {
          LogUtils.e("getRequest > catch exception", error: e);

          onSuccess(response.data);
        }
      } else {
        try {
          onError(
            ErrorModel(
              code: response.statusCode,
              message: json.decode(response.data)["message"],
            ),
          );
        } catch (e) {
          LogUtils.e("getRequest > catch exception", error: e);

          onError(
            ErrorModel(
              code: response.statusCode,
              message: response.statusMessage,
            ),
          );
        }
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(
        ErrorModel(
          code: 400,
          message: error.message,
        ),
      );
    } on SocketException catch (error) {
      onError(
        ErrorModel(
          code: 502,
          message: error.message,
        ),
      );
    } /* on BaseException catch (error) {
      onError(
        ErrorModel(
          code: error.code,
          message: error.message,
        ),
      );
    }*/
  }

  /// by calling [deleteRequest] and passing arguments we can perform DELETE request
  /// Ex. :
  /// [url] : without base url like "/users"
  /// [header] : argument defines the current request contains custom headers or not
  /// [onSuccess] : this callback will give the success response from the api
  /// [onError] : this callback will return the error with code & message so we can display on Ui thread accordingly
  static Future<void> deleteRequest({
    required String url,
    bool header = false,
    String? authToken,
    Map? data,
    Map<String, dynamic>? queryParameters,
    required OnSuccess onSuccess,
    required OnError onError,
  }) async {
    _dio.options.headers['Content-Type'] = 'application/json';
    if (authToken != null) {
      _dio.options.headers['Authorization'] = "Bearer $authToken";
    } else {
      try {
        _dio.options.headers
            .removeWhere((key, value) => key == "Authorization");
      } catch (exception) {
        log("postRequest > Authorization > exception :~> $exception");
      }
    }
    //
    Response response = await _dio.delete(
      url,
      data: data,
    );
    try {
      if (isValidResponse(response)) {
        try {
          onSuccess(json.decode(response.data));
        } catch (e) {
          LogUtils.e("deleteRequest catch exception", error: e);

          onSuccess(response.data);
        }
      } else {
        try {
          onError(
            ErrorModel(
              code: response.statusCode,
              message: json.decode(response.data)["message"],
            ),
          );
        } catch (e) {
          LogUtils.e("deleteRequest catch exception", error: e);

          onError(
            ErrorModel(
              code: response.statusCode,
              message: response.statusMessage,
            ),
          );
        }
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(
        ErrorModel(
          code: 400,
          message: error.message,
        ),
      );
    } on SocketException catch (error) {
      onError(
        ErrorModel(
          code: 502,
          message: error.message,
        ),
      );
    } /* on BaseException catch (error) {
      onError(
        ErrorModel(
          code: error.code,
          message: error.message,
        ),
      );
    }*/
  }

  static Future<void> uploadMediaUser({
    required String image,
    required String auth,
    required String phone,
    required String url,
    required OnSuccess onSuccess,
    required OnError onError,
    required ProgressCount progressCount,
  }) async {
    try {
      FormData formData = await getImageUploadParam(phone, image);
      LogUtils.i(" ${formData.fields.asMap()} ", name: "formData.fields");
      LogUtils.i(" ${formData.files.asMap()} ", name: "formData.files");
      _dio.options.headers['Authorization'] = 'Bearer $auth';
      _dio.options.headers['Content-Type'] =
          "multipart/form-data;  boundary=${formData.boundary}";
      _dio.options.headers['Content-Length'] = File(image).lengthSync();

      Response response = await _dio.post(url,
          data: formData, onReceiveProgress: progressCount);

      if (isValidResponse(response)) {
        try {
          onSuccess(json.decode(response.data));
        } catch (e) {
          LogUtils.e("uploadMediaUser catch exception", error: e);

          onSuccess(response.data);
        }
      } else {
        try {
          onError(
            ErrorModel(
              code: response.statusCode,
              message: json.decode(response.data)["message"],
            ),
          );
        } catch (e) {
          LogUtils.e("uploadMediaUser catch exception", error: e);

          onError(
            ErrorModel(
              code: response.statusCode,
              message: response.statusMessage,
            ),
          );
        }
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(
        ErrorModel(
          code: 400,
          message: error.message,
        ),
      );
    } on SocketException catch (error) {
      onError(
        ErrorModel(
          code: 502,
          message: error.message,
        ),
      );
    } /* on BaseException catch (error) {
      onError(
        ErrorModel(
          code: error.code,
          message: error.message,
        ),
      );
    }*/
    return;
  }

  static Future<FormData> getImageUploadParam(
    String phone,
    String profilePhoto,
  ) async {
    LogUtils.i(">>>>>>>>>>>>>>>>> ${profilePhoto.split("/")} <<<<<<<<",
        name: "imagePath");
    List<String> imagePathSlots = profilePhoto.split("/");
    LogUtils.i(imagePathSlots[imagePathSlots.length - 1],
        name: "image paths ????? ");

    FormData formData = FormData.fromMap({
      "phone": phone,
      "profile_image": await MultipartFile.fromFile(profilePhoto,
          filename: imagePathSlots[imagePathSlots.length - 1]),
    });
    LogUtils.i("${formData.files[0].value.filename}",
        name: "after execution >>>>>>.");
    return formData;
  }

  /// default method to check success call of Api

  static bool isValidResponse(Response response) {
    if (response.statusCode == StatusCodes.success) {
      try {
        Map responseData = response.data;
        LogUtils.e("checking by map", error: "isValidResponse try");

        if (responseData['status'] as bool == false) {
          return false;
        }
      } catch (e) {
        if (response.data['success'] as bool == false) {
          LogUtils.e("checking directly without map",
              error: "isValidResponse try");

          return false;
        }
      }
    } else {
      return false;
    }
    return true;
  }

  static Future<void> postRequestWithForm({
    required String? auth,
    required String url,
    required String? filePath,
    required Map data,
    required OnSuccess onSuccess,
    required OnError onError,
    required ProgressCount progressCount,
  }) async {
    try {
      FormData formData = FormData.fromMap(data.cast<String, dynamic>());
      LogUtils.i(" ${formData.fields}", name: "formData.fields");
      _dio.options.headers['auth_token'] = auth;
      _dio.options.headers['Content-Type'] =
          "multipart/form-data;  boundary=${formData.boundary}";
      // if(filePath!.isNotEmpty) {
      //   // _dio.options.headers['Content-Length'] = formData.length;
      //   _dio.options.headers['Content-Length'] = File(filePath).lengthSync();
      // }
      if (filePath!.isNotEmpty) {
        _dio.options.headers['Content-Length'] = formData.length;

        // _dio.options.headers['Content-Length'] = File(filePath).lengthSync();
      }

      Response response = await _dio.post(url,
          data: formData, onReceiveProgress: progressCount);

      if (isValidResponse(response)) {
        try {
          onSuccess(json.decode(response.data));
        } catch (e) {
          LogUtils.e("postRequestWithForm catch exception", error: e);

          onSuccess(response.data);
        }
      } else {
        try {
          onError(
            ErrorModel(
              code: response.statusCode,
              message: json.decode(response.data)["message"],
            ),
          );
        } catch (e) {
          LogUtils.e("postRequestWithForm catch exception", error: e);

          onError(
            ErrorModel(
              code: response.statusCode,
              message: response.statusMessage,
            ),
          );
        }
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(
        ErrorModel(
          code: 400,
          message: error.message,
        ),
      );
    } on SocketException catch (error) {
      onError(
        ErrorModel(
          code: 502,
          message: "Internet Connectivity Issue",
        ),
      );
    } /* on BaseException catch (error) {
      onError(
        ErrorModel(
          code: error.code,
          message: error.message,
        ),
      );
    }*/
    return;
  }

  static Future<void> download({
    required String url,
    required String savePath,
    String? authToken,
    required OnSuccess onSuccess,
    required OnError onError,
    required ProgressCount progressCount,
  }) async {
    LogUtils.i(" >>>> $savePath", name: "download path");

    if (authToken != null) {
      _dio.options.headers['auth_token'] = authToken;
    }
    try {
      Response response =
          await _dio.download(url, savePath, onReceiveProgress: progressCount);
      if (response.statusCode == StatusCodes.success) {
        onSuccess({"message": "File downloaded successfully."});
      } else {
        onError(
          ErrorModel(
            code: -1,
            message: "Download failed",
          ),
        );
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: "Connectivity Issue",
          ),
        );
      } else {
        onError(
          ErrorModel(
            code: error.response?.statusCode,
            message: error.message,
          ),
        );
      }
    } on FormatException catch (error) {
      onError(
        ErrorModel(
          code: 400,
          message: error.message,
        ),
      );
    } on SocketException catch (error) {
      onError(
        ErrorModel(
          code: 502,
          message: error.message,
        ),
      );
    } /* on BaseException catch (error) {
      onError(
        ErrorModel(
          code: error.code,
          message: error.message,
        ),
      );
    }*/
  }
}
