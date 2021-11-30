import 'package:http/http.dart';
import 'app_exceptions.dart';

class ServiceException {
  static returnResponse(Response response) {
    switch (response.statusCode) {
      case 4:
        throw QoutaException(response.body.toString());
      case 100:
        throw ItimesLimitExceededException(response.body.toString());
      case 200:
        throw PermissionException(response.body.toString());
      case 300:
        throw TokenInvalidException(response.body.toString());
      case 500:
        throw ParameterException(response.body.toString());
      case 501:
        throw MissingParameterException(response.body.toString());
      case 600:
        throw InvalidQueryException(response.body.toString());
      case 700:
        throw ServiceBusyException(response.body.toString());
      case 800:
        throw DataException(response.body.toString());
      case 901:
        throw IndividualAccountChangedNotAllowedException(
            response.body.toString());
      default:
        throw BadRequestException(response.body.toString());
    }
  }
}
