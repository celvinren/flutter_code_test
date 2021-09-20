import 'package:dev_coding_test_calvin/app/router/router.gr.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class RouterService {
  final DevCodingTestCalvinRouter router = DevCodingTestCalvinRouter();
}
