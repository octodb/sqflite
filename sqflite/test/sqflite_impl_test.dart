import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octodb_sqflite/src/factory_impl.dart';
import 'package:octodb_sqflite/src/mixin/factory.dart';
import 'package:octodb_sqflite/src/sqflite_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('sqflite', () {
    const channel = MethodChannel('com.tekartik.sqflite');

    final log = <MethodCall>[];
    String? response;

    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return response;
    });

    tearDown(() {
      log.clear();
    });

    test('databaseFactory', () async {
      expect(databaseFactory is SqfliteInvokeHandler, isTrue);
    });

    test('supportsConcurrency', () async {
      expect(supportsConcurrency, isFalse);
    });

    test('deprecated', () {
      // ignore: deprecated_member_use_from_same_package
      sqlfliteDatabaseFactory = null;
      sqfliteDatabaseFactory = null;
      [
        // ignore: unnecessary_statements
        sqlfliteDatabaseFactory,
        // ignore: unnecessary_statements
        sqfliteDatabaseFactory
      ].forEach((element) {
        expect(element, isNotNull);
      });
    });
  });
}
