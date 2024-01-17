class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return "$_message$_prefix";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet");
}
class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, "Request Time out");
}
class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal server error");
}
class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, "Invalid url");
}
class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "");
}
