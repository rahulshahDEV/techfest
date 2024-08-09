import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:byrahul/provider/dashboard_provider.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/connectivity.dart';
import 'package:byrahul/services/dashboard_service.dart';
import 'package:byrahul/utils/helper_methods/counter_widget.dart';
import 'package:byrahul/utils/helper_methods/custom_eventCard.dart';
import 'package:byrahul/utils/helper_methods/workshop_widget.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:byrahul/widgets/internet_connectivity.dart';
import 'package:byrahul/widgets/latest_blog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    DashboardService.getDashboard(context);
    streamSubscription = ConnectivityCheck.checkConnectivity(context: context);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = context.watch<DashboardProvider>().dashData;
    final _isConnected = context.watch<MainProvider>().isConnected;

    return _isConnected
        ? Scaffold(
            appBar: const MyAppBar(title: 'Dashboard'),
            body: dashboard.counter.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Palette.primary,
                    ),
                  )
                : ListView(
                    children: [
                      counterWidget(dashboard),
                      latestWidget(dashboard),
                      CustomEventcard(dashboard: dashboard),
                      WorkshopWidget(dashboard: dashboard)
                    ],
                  ),
          )
        : connectivityWidget();
  }
}
