import 'package:octodb_sqflite_common/src/mixin/dev_utils.dart';
import 'package:octodb_sqflite_common/src/mixin/import_mixin.dart';
import 'package:test/test.dart';

void main() {
  group('handler_mixin', () {
    // Check that public api are exported
    test('exported', () {
      <dynamic>[
        // ignore: deprecated_member_use_from_same_package
        SqfliteOptions,
        methodOpenDatabase,
        methodOpenDatabase,
        methodCloseDatabase,
        methodOptions,
        sqliteErrorCode,
        methodInsert,
        methodQuery,
        methodUpdate,
        methodExecute,
        methodBatch,
        // Factory
        buildDatabaseFactory, SqfliteInvokeHandler, SqfliteDatabaseFactoryBase,
        SqfliteDatabaseFactoryMixin, SqfliteDatabaseFactory,
        // Database
        SqfliteDatabaseOpenHelper, SqfliteDatabase, SqfliteDatabaseMixin,
        SqfliteDatabaseBase,
        // Exception
        SqfliteDatabaseException,
        // ignore: deprecated_member_use_from_same_package
        devPrint, devWarning,
      ].forEach((dynamic value) {
        expect(value, isNotNull);
      });
    });
  });
}
