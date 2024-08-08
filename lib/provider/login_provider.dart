import 'package:byrahul/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  void loadingStatus({required bool status}) {
    isLoading = status;
    notifyListeners();
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) {
    loadingStatus(status: true);
    Controller.login(email: email, password: password, context: context);
  }
}
