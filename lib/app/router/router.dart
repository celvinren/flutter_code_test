import 'package:auto_route/auto_route.dart';

import 'package:dev_coding_test_calvin/ui/views/home/home_view.dart';
import 'package:dev_coding_test_calvin/ui/views/search_by_client_number/search_by_client_number_view.dart';
import 'package:dev_coding_test_calvin/ui/views/startup/startup_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: SearchByClientNumberView),
  ],
)
class $DevCodingTestCalvinRouter {}
