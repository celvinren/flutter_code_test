// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:dev_coding_test_calvin/ui/views/daily_summary_report/daily_summary_report_view.dart'
    as _i6;
import 'package:dev_coding_test_calvin/ui/views/home/home_view.dart' as _i3;
import 'package:dev_coding_test_calvin/ui/views/search_by_client_number/search_by_client_number_view.dart'
    as _i4;
import 'package:dev_coding_test_calvin/ui/views/total_amount_by_product_and_day/total_amount_by_product_and_day_view.dart'
    as _i5;
import 'package:flutter/material.dart' as _i2;

class DevCodingTestCalvinRouter extends _i1.RootStackRouter {
  DevCodingTestCalvinRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.HomeView();
        }),
    SearchByClientNumberRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.SearchByClientNumberView();
        }),
    TotalAmountByProductAndDayRoute.name: (routeData) =>
        _i1.AdaptivePage<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i5.TotalAmountByProductAndDayView();
            }),
    DailySummaryReportRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.DailySummaryReportView();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(SearchByClientNumberRoute.name,
            path: '/search-by-client-number-view'),
        _i1.RouteConfig(TotalAmountByProductAndDayRoute.name,
            path: '/total-amount-by-product-and-day-view'),
        _i1.RouteConfig(DailySummaryReportRoute.name,
            path: '/daily-summary-report-view')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class SearchByClientNumberRoute extends _i1.PageRouteInfo {
  const SearchByClientNumberRoute()
      : super(name, path: '/search-by-client-number-view');

  static const String name = 'SearchByClientNumberRoute';
}

class TotalAmountByProductAndDayRoute extends _i1.PageRouteInfo {
  const TotalAmountByProductAndDayRoute()
      : super(name, path: '/total-amount-by-product-and-day-view');

  static const String name = 'TotalAmountByProductAndDayRoute';
}

class DailySummaryReportRoute extends _i1.PageRouteInfo {
  const DailySummaryReportRoute()
      : super(name, path: '/daily-summary-report-view');

  static const String name = 'DailySummaryReportRoute';
}
