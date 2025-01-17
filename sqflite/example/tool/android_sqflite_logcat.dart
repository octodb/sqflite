// @dart=2.9
import 'package:process_run/shell.dart';
import 'package:octodb_sqflite_example/src/common_import.dart';

Future<void> main() async {
  final controller = StreamController<List<int>>();
  final shell = Shell(stdout: controller.sink, verbose: false);

  controller.stream
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((line) {
    if (line.contains('Sqflite')) {
      print('$line');
    }
  });

  await shell.run('adb logcat');

  // We'll never get there actually...
  await controller.close();
}
