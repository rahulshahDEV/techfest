import 'package:flutter/material.dart';

class EditorProvider extends ChangeNotifier {
  bool maxLineEnabled = false;
  String? slug;
  void enableMaxLine(String text) {
    if (text.length > 1) {
      maxLineEnabled = true;
    }
    notifyListeners();
  }

  void setSlug(String blogSlug) {
    slug = blogSlug;
    notifyListeners();
  }

  void disposeSlug() {
    slug = null;
  }
}
