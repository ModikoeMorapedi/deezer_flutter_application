import 'dart:io';

import 'package:deezer_flutter_application/utils/Exceptions/app_exceptions.dart';
import 'package:deezer_flutter_application/utils/enums/view_state_enum.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseModel extends Model {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setFailureState(Exception exception) {
    print(exception);

    if (exception is QoutaException) {
      _state = ViewState.Qouta;
    } else if (exception is SocketException) {
      _state = ViewState.NetworkError;
    } else if (exception is ItimesLimitExceededException) {
      _state = ViewState.LimitExceeded;
    } else if (exception is PermissionException) {
      _state = ViewState.Permission;
    } else if (exception is TokenInvalidException) {
      _state = ViewState.InvalidToken;
    } else if (exception is ParameterException) {
      _state = ViewState.Parameter;
    } else if (exception is MissingParameterException) {
      _state = ViewState.MissingParameter;
    } else if (exception is InvalidQueryException) {
      _state = ViewState.InvalidQuery;
    } else if (exception is ServiceBusyException) {
      _state = ViewState.ServiceBusy;
    } else if (exception is DataException) {
      _state = ViewState.DataNotFound;
    } else if (exception is IndividualAccountChangedNotAllowedException) {
      _state = ViewState.IndividualAccount;
    } else if (exception is BadRequestException) {
      _state = ViewState.BadRequest;
    } else {
      _state = ViewState.Error;
    }

    notifyListeners();
  }

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }
}
