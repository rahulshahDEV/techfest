import 'dart:async';

import 'package:byrahul/provider/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';

class ConnectivityCheck {
  static StreamSubscription? checkConnectivity(
      {required BuildContext context}) {
    return InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            if (context.mounted) {
              context.read<MainProvider>().updateInternetStatus(status: true);
            }
          case InternetStatus.disconnected:
            if (context.mounted) {
              context.read<MainProvider>().updateInternetStatus(status: false);
            }
            break;
          default:
            if (context.mounted) {
              context.read<MainProvider>().updateInternetStatus(status: false);
            }
        }
      },
    );
  }
}
