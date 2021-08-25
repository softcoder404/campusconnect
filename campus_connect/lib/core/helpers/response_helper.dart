import 'dart:io';

class NetworkResponse {
  String message;
  int code;
  var data;
  var error;

  NetworkResponse({
    this.message = 'An unknown response received.',
    this.code = 400,
    this.data,
  });

  NetworkResponse.success({
    this.message = 'An unknown response received.',
    this.data,
    this.error,
  }) : code = 200;

  NetworkResponse.warning({
    this.message = 'An unknown response received.',
    this.data,
    this.error,
  }) : code = 400;

  NetworkResponse.error({
    this.message = 'An unknown response received.',
    this.data,
    this.error,
  }) : code = 500;

  @override
  String toString() {
    return 'Response{message: $message, code: $code, data: $data, error: $error}';
  }

  bool get userError => code >= 400 && code < 500;

  bool get serverError => code >= 500 && code < 600;

  bool get hasError => userError || serverError;

  bool get success => code >= 100 && code < 400;

  handleError(error, trace) {
    code = 500;
    message = 'An error occurred, please try again later.';
    if (error is SocketException) {
      print('error message: ${error.message}');
      // errorCode == 8 means device is offline
      // errorCode == 61 or 111 means endpoint cannot be reached
      print('OS error code: ${error.osError!.errorCode}');
      print('OS error message: ${error.osError!.message}');
      if (error.osError!.errorCode == 8) {
        message = 'Please check your internet connection.';
      } else if (error.osError!.errorCode == 61 ||
          error.osError!.errorCode == 111) {
        message = 'The server could not be reached, please try again later.';
      } else {
        message =
            'A network error prevented us from reaching the server, please try again later.';
      }
    }

    print(error);
    print(trace);
  }
}
