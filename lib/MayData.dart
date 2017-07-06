library autonitify_issues.my_data;

import 'package:polymer/polymer.dart';

class MyData extends JsProxy {
  @reflectable
  String name;

  @reflectable
  int age;

  MyData(this.name, this.age);
}