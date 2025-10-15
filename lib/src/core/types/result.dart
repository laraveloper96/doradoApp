import 'package:currency_converter/src/core/error/failures.dart';

/// Type alias for Result pattern
/// Returns a tuple where the first element is a Failure (if any) and the second is the data (if successful)
/// Only one of the two should be non-null at any time
typedef Result<T> = (Failure?, T?);

/// Extension methods for Result type
extension ResultExtension<T> on Result<T> {
  /// Returns true if the result is successful (no failure)
  bool get isSuccess => $1 == null && $2 != null;

  /// Returns true if the result is a failure
  bool get isFailure => $1 != null && $2 == null;

  /// Returns the data if successful, null otherwise
  T? get data => $2;

  /// Returns the failure if failed, null otherwise
  Failure? get error => $1;
}

/// Helper class for creating Result instances
class ResultHelper {
  /// Creates a successful result
  static Result<T> success<T>(T data) => (null, data);

  /// Creates a failed result
  static Result<T> failure<T>(Failure failure) => (failure, null);
}