@HtmlImport('second_issue.html')
library autonitify_issues.second_issue;

import 'dart:html';

import 'package:observe/observe.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:web_components/web_components.dart';


@PolymerRegister('second-issue')
class SecondIssue extends PolymerElement with AutonotifyBehavior, Observable {

  @observable
  @property
  ObservableList<MyObservableData> data;


  SecondIssue.created() : super.created();


  @override
  void attached() {
    data = new ObservableList.from([
      new MyObservableData('Eert', 12),
      new MyObservableData('Wdga', 13),
      new MyObservableData('Grfdg', 14),
    ]);
  }

  @reflectable
  void btnAdd_click(Event e, [_]) {
    var item = new MyObservableData('Ugvs', 15);
    data.add(item);
  }

  @reflectable
  void btrSet_click(Event e, [_]) {
    var item = data[1];
    item.age = 66;
  }

  @reflectable
  int sortData(MyObservableData a, MyObservableData b) {
    return b.age - a.age;
  }
}


class MyObservableData extends Observable {
  @observable
  String name;

  @observable
  int age;

  MyObservableData(this.name, this.age);
}