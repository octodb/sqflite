import 'package:octodb_sqflite_common/sqlite_api.dart';
import 'package:octodb_sqflite_common/src/mixin/import_mixin.dart';

/// Dev extension
extension SqfliteDatabaseFactoryDev on DatabaseFactory {
  /// Change the log level if you want to see the SQL query
  /// executed natively.
  ///
  /// Deprecated for temp usage only
  @deprecated
  Future<void> setLogLevel(int logLevel) async {
    await setOptions(SqfliteOptions(logLevel: logLevel));
  }

  /// Testing only.
  ///
  /// deprecated on purpose to remove from code.
  @deprecated
  Future<void> setOptions(SqfliteOptions options) async {
    await (this as SqfliteInvokeHandler)
        .invokeMethod<dynamic>(methodOptions, options.toMap());
  }

  /// Compat set Databases path.
  ///
  /// setDatabasesPath will be exported later (post 1.3.0)
  Future setDatabasesPath(String? path) async {
    await (this as SqfliteDatabaseFactoryMixin).setDatabasesPath(path);
  }
}
