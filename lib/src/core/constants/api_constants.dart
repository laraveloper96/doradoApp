/// API constants for the Currency Converter app
class ApiConstants {
  ApiConstants._();

  /// Base URL for Eldorado.io API
  static const String baseUrl =
      'https://74j6q7lg6a.execute-api.eu-west-1.amazonaws.com';

  /// API endpoints
  static const String currenciesEndpoint = '/currencies';
  static const String exchangeRateEndpoint = '/exchange-rate';
  static const String convertEndpoint = '/convert';

  /// API timeout configurations
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds

  /// API headers
  /// Default headers for API requests
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
