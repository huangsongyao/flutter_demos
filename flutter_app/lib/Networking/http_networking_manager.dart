import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:rxdart/rxdart.dart';

int kNetworkingSuccessStatusCode = 200;

typedef Future<Object> NetworkingOnResult(NetworkingResponse success);
typedef Future<Object> NetworkingOnError(NetworkingResponse failure);

enum ServerAddressModel {
  debugType,
  testType,
  releaseType,
}

class NetworkingManager with RxDartPublishMergesSignal {
  factory NetworkingManager() => _getInstance();

  static NetworkingManager get instance => _getInstance();
  static NetworkingManager _instance;
  String _server;
  Map<String, String> _requestHeaders;

  NetworkingManager._internal() {
    //初始化

  }

  static NetworkingManager _getInstance() {
    if (_instance == null) {
      _instance = new NetworkingManager._internal();
    }
    return _instance;
  }

  configRequestHeaders(
      ServerAddressModel type, Map<String, String> requestHeaders) {
    _server = {
      ServerAddressModel.debugType: "http://172.16.4.2/api/",
      ServerAddressModel.testType: "https://",
      ServerAddressModel.releaseType: "http://"
    }[type];
    _requestHeaders = requestHeaders;
  }

  static String queryStringFromArgumentss(Map<String, Object> arguments) {
    String argumentsPath = "";
    if (arguments.values.length > 0) {
      arguments.forEach((String key, Object value) {
        argumentsPath = "${argumentsPath}&${key}=${value}";
      });
    }
    print("HTTP--Get请求入参为:${argumentsPath}");
    return argumentsPath;
  }

//*************************************************************************************************************Get Http Methods**********************************************************************************************************************

  getHttp(String urlPath, Map<String, Object> arguments,
      NetworkingOnResult onResult, NetworkingOnError onError) async {
    _getHttpMethodSelector(urlPath, arguments, null, onResult, onError);
  }

  PublishSubject rxdartGetHttp(String urlPath, Map<String, Object> arguments,
      Map<String, String> requestAllHeaders) {
    PublishSubject subject = PublishSubject();
    _getHttpMethodSelector(urlPath, arguments, requestAllHeaders, (response) {
      subject.add(response);
      subject.close();
    }, (failure) {
      subject.add(failure);
      subject.close();
    });
    return subject;
  }

  PublishSubject<List> zipRequests(List<NetworkingRequest> requests) {
    //字段类型不能为null
    try {
      List<Stream> streams = List();
      for (NetworkingRequest request in requests) {
        streams.add(Observable.just(http.get(request.getRequestUrl(_server),
            headers: request.requestAllHeaders)));
      }
      return zips(streams);
    } catch (error) {
      print("+++++++++++++++++++HTTP--Get请求异常:${error}+++++++++++++++++++");
      return null;
    }
  }

  /*
  * Http的get请求的私有方法，提供了关于请求的各项参数，包括：url请求的连接地址[方法中自动拼接完整]、用于拼接在get请求中的参数[格式为Map类型，key-value]、请求头的参数[格式为Map类型，key-value]、get请求成功的结果回调函数、get请求失败的失败回调函数
  * _getHttpMethodSelector("App_Data/getAllQuoteV2", null, null, (Map<String, dynamic> body) {
      //get请求成功的回调事件
    }, (String errorString, var error) {
      //get请求失败的回调事件
    });
  * */
  _getHttpMethodSelector(
      String urlPath,
      Map<String, Object> arguments,
      Map<String, String> requestAllHeaders,
      NetworkingOnResult onResult,
      NetworkingOnError onError) async {
    //字段类型不能为null
    assert(!urlPath.isEmpty);
    try {
      //如果带有参数，则拼接好参数到url中，转化为完整的请求地址
      String requestUrl = "${this._server}/${urlPath}";
      if ((arguments != null) && (arguments.values.length > 0)) {
        requestUrl =
            "${requestUrl}?${NetworkingManager.queryStringFromArgumentss(arguments)}";
      }
      print("\nHTTP--Get请求的远端地址为:${requestUrl}");
      await http
          .get(requestUrl, headers: requestAllHeaders)
          .then((var response) {
        if (onResult != null) {
          NetworkingResponse success =
              NetworkingResponse.response(response, true);
          success.httpSuccess();
          onResult(success);
        }
      }).catchError((var error) {
        if (onError != null) {
          NetworkingResponse failure = NetworkingResponse.error(error, true);
          failure.httpFailure();
          onError(failure);
        }
      });
    } catch (error) {
      print("+++++++++++++++++++HTTP--Get请求异常:${error}+++++++++++++++++++");
    }
  }

//*************************************************************************************************************Post Http Methods*******************************************************************************************************************

  postHttp(String urlPath, Map<String, Object> arguments,
      NetworkingOnResult onResult, NetworkingOnError onError) async {
    _postHttpMethodSelector(urlPath, arguments, null, onResult, onError);
  }

  PublishSubject rxdartPostHttp(String urlPath, Map<String, Object> arguments,
      Map<String, String> requestAllHeaders) {
    PublishSubject subject = PublishSubject();
    _postHttpMethodSelector(urlPath, arguments, requestAllHeaders, (response) {
      subject.add(response);
      subject.close();
    }, (failure) {
      subject.add(failure);
      subject.close();
    });
    return subject;
  }

  /*
  * Http的post请求的私有方法，提供了关于请求的各项参数，包括：url请求的连接地址[方法中自动拼接完整]、用于拼接在get请求中的参数[格式为Map类型，key-value]、请求头的参数[格式为Map类型，key-value]、get请求成功的结果回调函数、get请求失败的失败回调函数
  * _postHttpMethodSelector("App_Data/getAllQuoteV2", null, null, (Map<String, dynamic> body) {
      //get请求成功的回调事件
    }, (String errorString, var error) {
      //get请求失败的回调事件
    });
  * */
  _postHttpMethodSelector(
      String urlPath,
      Map<String, Object> arguments,
      Map<String, String> requestAllHeaders,
      NetworkingOnResult onResult,
      NetworkingOnError onError) async {
    //字段类型不能为null
    assert(!urlPath.isEmpty);
    try {
      String requestUrl = "${this._server}/${urlPath}";
      print("\nHTTP--Post请求的远端地址为:${requestUrl}");
      //完整的请求地址包括：完整的url，请求头，post body的utf8编码，指定utf8编码格式
      await http
          .post(requestUrl,
              headers: requestAllHeaders,
              body: json.encode(arguments),
              encoding: Utf8Codec())
          .then((var response) {
        if (onResult != null) {
          NetworkingResponse success =
              NetworkingResponse.response(response, false);
          success.httpSuccess();
          onResult(success);
        }
      }).catchError((var error) {
        if (onError != null) {
          NetworkingResponse failure = NetworkingResponse.error(error, false);
          failure.httpFailure();
          onError(failure);
        }
      });
    } catch (error) {
      print("+++++++++++++++++++HTTP--Post请求异常:${error}+++++++++++++++++++");
    }
  }
}

class NetworkingRequest {
  String urlPath;
  Map<String, Object> arguments;
  Map<String, String> requestAllHeaders;
  bool isGet;

  NetworkingRequest(String urlPath, Map<String, Object> arguments,
      Map<String, String> requestAllHeaders, bool isGet) {
    this.urlPath = urlPath;
    this.arguments = arguments;
    this.requestAllHeaders = requestAllHeaders;
    this.isGet = isGet;
  }

  factory NetworkingRequest.simple(
          String urlPath, Map<String, Object> arguments, bool isGet) =>
      NetworkingRequest(urlPath, arguments, null, isGet);

  String getRequestUrl(String server) {
    String requestUrl = "${server}/${this.urlPath}";
    if (!this.isGet) {
      return requestUrl;
    }
    if ((this.arguments != null) && (this.arguments.values.length > 0)) {
      requestUrl =
          "${requestUrl}?${NetworkingManager.queryStringFromArgumentss(this.arguments)}";
    }
    return requestUrl;
  }

  bool isEmptyRequest() {
    return this.urlPath.isEmpty;
  }
}

class NetworkingResponse {
  var response;
  Error error;
  bool isGet;

  NetworkingResponse(var response, Error error, bool isGet) {
    this.response = response;
    this.error = error;
    this.isGet = isGet;
  }

  factory NetworkingResponse.response(var response, bool isGet) =>
      NetworkingResponse(response, null, isGet);

  factory NetworkingResponse.error(Error error, bool isGet) =>
      NetworkingResponse(null, error, isGet);

  int statusCode() {
    return (this.response as Response).statusCode;
  }

  Map<String, dynamic> toResult() {
    Map<String, dynamic> json = JsonDecoder().convert(this.response.body);
    return json;
  }

  String toErrorString() {
    return this.error.toString();
  }

  int toErrorCode() {
    return this.error.hashCode;
  }

  httpFailure() {
    print(
        "\nHTTP--Get请求失败，失败原因:${toErrorString()} \n失败的状态码:${toErrorCode()} \n完整的error错误信息如下:${this.error}");
  }

  httpSuccess() {
    var type = this.isGet ? "Get" : "Post";
    print("\nHTTP--${type}请求结果:${toResult()}");
  }
}

class RxDartPublishMergesSignal {
  //将多个Stream流的数据signal合并成一个二维的List后，通过PublishSubject的listen函数返回，并自动执行close函数关闭
  PublishSubject<List> zips(List<Stream> streams) {
    List datas = List();
    PublishSubject<List> subject = PublishSubject<List>();
    print("streams => ${streams}");
    Observable.zip(streams, (values) {
      print("values => ${values}");
      return Observable.just(values);
    }).listen((onData) {
      print("onData runtimetype => ${onData.runtimeType}");
      print(onData);
      onData.listen((value) {
        print("value runtimetype => ${value.runtimeType}");
        print(value);
        for (Future future in value) {
          future.then((response) {
            datas.add(response);
            print(response.body);
          }).catchError((error) {
            datas.add(error);
          });
        }
      });
    }).onDone(() {
      subject.add(datas);
      subject.close();
    });
    return subject;
  }
}
