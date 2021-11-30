/// A value mapping the View UI to the state in the Model.
///
/// This will contain all the possible states for any view, custom enums can be created for separate views if required
// ignore_for_file: constant_identifier_names

enum ViewState {
  Idle, // When nothing is happening or just initialized
  Busy, // Typically shows a loading indicator of some sorts
  DataFetched, // Indicates that there's data available on the view
  NoDataAvailable, // Indicates that data was fetched successfully but nothing is available
  Error, // Indicates there's an error on the view
  Success, // Successful action occurred
  Qouta,
  NetworkError,
  BadRequest,
  LimitExceeded,
  InvalidToken,
  MissingParameter,
  InvalidQuery,
  ServiceBusy,
  DataNotFound,
  IndividualAccount,
  Permission,
  Parameter
}
