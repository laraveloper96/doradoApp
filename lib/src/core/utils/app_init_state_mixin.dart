import 'dart:async';

import 'package:flutter/material.dart';

// This class standardize the way
// a StatefulWidget (typically an app root widget)
// initializes its state, for example when initializing app dependencies.
mixin AppInitStateMixin<T extends StatefulWidget> on State<T> {
  /// Whether the app has been initialized.
  bool _initialized = false;
  bool get initialized => _initialized;

  @override
  void initState() {
    unawaited(_initApp());
    super.initState();
  }

  /// Initialize the app
  Future<void> _initApp() async {
    if (_initialized) {
      return;
    }
    await initApp();
    setState(() {
      _initialized = true;
    });
  }

  /// Action to trigger when the app is initialized.
  Future<void> initApp();
}
