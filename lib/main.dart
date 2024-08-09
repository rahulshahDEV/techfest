import 'dart:async';

import 'package:byrahul/app_router/route_import.dart';
import 'package:byrahul/provider/dashboard_provider.dart';
import 'package:byrahul/provider/editor_provider.dart';
import 'package:byrahul/provider/login_provider.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/provider/user_provider.dart';
import 'package:byrahul/services/connectivity.dart';
import 'package:byrahul/utils/themes/themes.dart';
import 'package:byrahul/widgets/internet_connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // List<ConnectivityResult> connectivityResult =
  //     await (Connectivity().checkConnectivity());
  // late StreamSubscription subscription;

  // if (connectivityResult.contains(ConnectionState.none)) {
  //   print('no internet');
  // }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => EditorProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MainProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DashboardProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = ConnectivityCheck.checkConnectivity(context: context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isConnected = context.watch<MainProvider>().isConnected;
    return _isConnected
        ? MaterialApp.router(
            debugShowCheckedModeBanner: false,

            routerConfig: _appRouter.config(),
            // home: const Wrapper(),
            theme: lightMode,
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false, home: connectivityWidget());
  }
}
