// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dev_coding_test_calvin/ui/views/daily_summary_report/daily_summary_report_view.dart'
    as _i4;
import 'package:dev_coding_test_calvin/ui/views/home/home_view.dart' as _i1;
import 'package:dev_coding_test_calvin/ui/views/search_by_client_number/search_by_client_number_view.dart'
    as _i2;
import 'package:dev_coding_test_calvin/ui/views/total_amount_by_product_and_day/total_amount_by_product_and_day_view.dart'
    as _i3;
import 'package:flutter/material.dart' as _i6;

class DevCodingTestCalvinRouter extends _i5.RootStackRouter {
  DevCodingTestCalvinRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.HomeView());
    },
    SearchByClientNumberRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.SearchByClientNumberView());
    },
    TotalAmountByProductAndDayRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.TotalAmountByProductAndDayView());
    },
    DailySummaryReportRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.DailySummaryReportView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/'),
        _i5.RouteConfig(SearchByClientNumberRoute.name,
            path: '/search-by-client-number-view'),
        _i5.RouteConfig(TotalAmountByProductAndDayRoute.name,
            path: '/total-amount-by-product-and-day-view'),
        _i5.RouteConfig(DailySummaryReportRoute.name,
            path: '/daily-summary-report-view')
      ];
}

/// generated route for [_i1.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.SearchByClientNumberView]
class SearchByClientNumberRoute extends _i5.PageRouteInfo<void> {
  const SearchByClientNumberRoute()
      : super(name, path: '/search-by-client-number-view');

  static const String name = 'SearchByClientNumberRoute';
}

/// generated route for [_i3.TotalAmountByProductAndDayView]
class TotalAmountByProductAndDayRoute extends _i5.PageRouteInfo<void> {
  const TotalAmountByProductAndDayRoute()
      : super(name, path: '/total-amount-by-product-and-day-view');

  static const String name = 'TotalAmountByProductAndDayRoute';
}

/// generated route for [_i4.DailySummaryReportView]
class DailySummaryReportRoute extends _i5.PageRouteInfo<void> {
  const DailySummaryReportRoute()
      : super(name, path: '/daily-summary-report-view');

  static const String name = 'DailySummaryReportRoute';
}
