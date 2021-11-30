class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class QoutaException extends AppException {
  QoutaException([message]) : super(message, "QUOTA: ");
}

class ItimesLimitExceededException extends AppException {
  ItimesLimitExceededException([message])
      : super(message, "ITEMS_LIMIT_EXCEEDED: ");
}

class PermissionException extends AppException {
  PermissionException([message]) : super(message, "PERMISSION: ");
}

class TokenInvalidException extends AppException {
  TokenInvalidException([message]) : super(message, "TOKEN_INVALID: ");
}

class ParameterException extends AppException {
  ParameterException([message]) : super(message, "PARAMETER: ");
}

class MissingParameterException extends AppException {
  MissingParameterException([message]) : super(message, "PARAMETER_MISSING: ");
}

class InvalidQueryException extends AppException {
  InvalidQueryException([message]) : super(message, "QUERY_INVALID: ");
}

class ServiceBusyException extends AppException {
  ServiceBusyException([message]) : super(message, "SERVICE_BUSY: ");
}

class DataException extends AppException {
  DataException([message]) : super(message, "DATA_NOT_FOUND: ");
}

class IndividualAccountChangedNotAllowedException extends AppException {
  IndividualAccountChangedNotAllowedException([message])
      : super(message, "INDIVIDUAL_ACCOUNT_NOT_ALLOWED: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
