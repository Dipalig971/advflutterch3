import 'package:flutter/material.dart';

class ChromeProvider extends ChangeNotifier{
  double progress = 0;
  String search='';

  void progressChange(int progress)
  {
    this.progress = progress/100;
    notifyListeners();
  }

  void onsearch(String search)
  {
    this.search = search;
    notifyListeners();
  }
}