import 'package:currency_converter/src/core/types/result.dart';
import 'package:equatable/equatable.dart';

/// Base class for all use cases
mixin UseCase<Type, Params> {
  /// Call method to execute the use case
  Future<Result<Type>> call(Params params);
}

/// Class to be used when no parameters are needed
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
