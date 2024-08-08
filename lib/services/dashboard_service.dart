import 'package:byrahul/constant.dart';
import 'package:byrahul/model/dashboard.dart';
import 'package:byrahul/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardService {
  static Future<void> getDashboard(BuildContext context) async {
    try {
      var response = await dio.get('$URI/dashboard');
      final dashboardData = await Dashboard.fromJson(response.data);
      context.read<DashboardProvider>().setDashData(dashboardData);
    } catch (e) {
      print(e.toString());
    }
  }
}
