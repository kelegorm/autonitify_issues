@HtmlImport('main_app.html')
library autonitify_issues.main_app;

import 'dart:html';

import 'package:observe/observe.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:autonitify_issues/my_selector.dart'; // ignore: unused_import
import 'package:autonitify_issues/my_viewer.dart'; // ignore: unused_import
import 'package:web_components/web_components.dart';


@PolymerRegister('main-app')
class MainApp extends PolymerElement with AutonotifyBehavior, Observable {

  @observable
  @property
  Controller controller;


  MainApp.created() : super.created();


  @override
  void attached() {
    controller = new Controller();

    controller.data = new ObservableList.from([
      new MyData('1) First', 'Simpson'),
      new MyData('2) Second', 'Griffin'),
      new MyData('3) Third', 'Stranger'),
    ]);

    controller.selected = controller.data[0];
  }
}


class MyData extends Observable {
  @observable
  String name;

  @observable
  String surname;

  MyData(this.name, this.surname);

  @override
  String toString() => 'name: $name, surname: $surname';
}


class Controller extends Observable {
  @observable
  MyData selected;

  @observable
  ObservableList<MyData> data;
}