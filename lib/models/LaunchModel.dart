import 'package:flutter/widgets.dart';

class MyModel with ChangeNotifier{
  String someValue = 'Hello';
  void doSomething() {
    someValue=(someValue == 'Goodbye')?'Hello':'Goodbye';
    print(someValue);
    notifyListeners();
  }
}