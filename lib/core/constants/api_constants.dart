class ApiConstants {
  static const String apiBaseUrl = "https://api.spacexdata.com/v4/";
  static const String rockets = "rockets";
  static const String capsulesEndPoint = "capsules";
  static const String crew = "crew";
  static const String company = "company";
  static const String launches = "launches";
  static const String ships = "ships";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
}
