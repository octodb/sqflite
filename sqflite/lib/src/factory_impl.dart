import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:octodb_sqflite/sqflite.dart';
import 'package:octodb_sqflite/src/exception_impl.dart' as impl;
import 'package:octodb_sqflite/src/sqflite_impl.dart' as impl;
import 'package:octodb_sqflite/src/sqflite_import.dart';

SqfliteDatabaseFactory? _databaseFactory;

/// sqflite Default factory
DatabaseFactory get databaseFactory => sqfliteDatabaseFactory;

/// Change the default factory.
///
/// Be aware of the potential side effect. Any library using sqflite
/// will have this factory as the default for all operations.
///
/// This setter must be call only once, before any other calls to sqflite.
set databaseFactory(DatabaseFactory? databaseFactory) {
  // Warn when changing. might throw in the future
  if (databaseFactory != null) {
    if (!(databaseFactory is SqfliteDatabaseFactory)) {
      throw ArgumentError.value(
          databaseFactory, 'databaseFactory', 'Unsupported sqflite factory');
    }
    if (_databaseFactory != null) {
      stderr.writeln('''
*** sqflite warning ***

You are changing sqflite default factory.
Be aware of the potential side effects. Any library using sqflite
will have this factory as the default for all operations.

*** sqflite warning ***
''');
    }
    sqfliteDatabaseFactory = databaseFactory;
  } else {
    /// Will use the plugin sqflite factory
    sqfliteDatabaseFactory = null;
  }
}

/// sqflite Default factory
///
/// Definition with a typo error.
/// - Will be soon deprecated
/// - Will be removed in 2.0.0
/// @deprecated
SqfliteDatabaseFactory get sqlfliteDatabaseFactory =>
    _databaseFactory ??= SqfliteDatabaseFactoryImpl();

/// Change the default factory. test only.
///
/// Definition with a typo error.
///
/// Will be removed in 2.0.0
@Deprecated('Use databaseFactory')
set sqlfliteDatabaseFactory(SqfliteDatabaseFactory? databaseFactory) =>
    _databaseFactory = databaseFactory;

/// sqflite Default factory
@visibleForTesting
SqfliteDatabaseFactory get sqfliteDatabaseFactory =>
    _databaseFactory ??= SqfliteDatabaseFactoryImpl();

/// Change the default factory. test only.
@visibleForTesting
set sqfliteDatabaseFactory(SqfliteDatabaseFactory? databaseFactory) =>
    _databaseFactory = databaseFactory;

/// Factory implementation
class SqfliteDatabaseFactoryImpl with SqfliteDatabaseFactoryMixin {
  @override
  Future<T> wrapDatabaseException<T>(Future<T> Function() action) =>
      impl.wrapDatabaseException(action);

  @override
  Future<T> invokeMethod<T>(String method, [dynamic arguments]) =>
      impl.invokeMethod(method, arguments);

  /*
  /// Old implementation which does not handle hot-restart and Android restart
  @override
  Future<void> deleteDatabase(String path) async {
    path = await fixPath(path);

      try {
        await File(path).delete(recursive: true);
      } catch (_) {
        // 0.8.4
        // print(_);
      }
  }
  */

  /// Optimized but could be removed
  @override
  Future<bool> databaseExists(String path) async {
    path = await fixPath(path);
    try {
      // avoid slow async method
      return File(path).existsSync();
    } catch (_) {}
    return false;
  }
}
