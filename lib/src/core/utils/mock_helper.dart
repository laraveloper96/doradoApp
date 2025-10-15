import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Helper class for handling mock responses from local JSON files.
///
/// This class provides methods to simulate network requests by reading data
/// from mock JSON strings, and to handle real HTTP requests.
mixin MockResponseHelper {
  /// Map with decoded data from a JSON string
  Future<K> _decodeData<K extends Object>(String data) async {
    final jsonValue = await rootBundle.loadString(data);
    return json.decode(jsonValue) as K;
  }

  Future<T> handleMockRequest<T extends Object, K extends Object>({
    required String endpointFile,
    required T Function(K response) mapper,
    Duration fakeLoadingTime = Durations.extralong4,
  }) async {
    try {
      // Create fake loading time to simulate network latency
      await Future<void>.delayed(fakeLoadingTime);
      // Get data from the endpoint (which contains mock JSON)
      final fakeResponse = await _decodeData<K>(endpointFile);
      return mapper(fakeResponse);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
