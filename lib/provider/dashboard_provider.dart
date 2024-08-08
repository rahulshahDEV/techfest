import 'package:flutter/material.dart';

import '../model/dashboard.dart';

class DashboardProvider extends ChangeNotifier {
  Dashboard _dashboardData = Dashboard(
    blogs: [],
    counter: [],
    events: [],
    workshops: [],
  );

  Dashboard get dashData => _dashboardData;

  void setDashData(Dashboard data) {
    _dashboardData = data;
    notifyListeners();
  }
}
