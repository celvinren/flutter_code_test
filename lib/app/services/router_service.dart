import "package:injectable/injectable.dart";
import "package:dev_coding_test_calvin/app/router/router.dart";
    
@lazySingleton
class RouterService {
  final DevCodingTestCalvinRouter router = DevCodingTestCalvinRouter();
}