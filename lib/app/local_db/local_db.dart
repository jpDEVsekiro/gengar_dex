import 'dart:io';

import 'package:gengar_dex/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class LocalDB {
  /// The Store of this app.
  late final Store store;

  LocalDB._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<LocalDB> create() async {
    final Directory docsDir = await getApplicationDocumentsDirectory();
    Directory directory = Directory(p.join(docsDir.path, 'obx_gengar_dex'));
    directory.createSync(recursive: true);

    final store = await openStore(directory: directory.path);
    return LocalDB._create(store);
  }
}
