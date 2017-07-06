@HtmlImport('first_issue.html')
library autonitify_issues.first_issue;

import 'dart:html';

import 'package:autonitify_issues/MayData.dart';
import 'package:observe/observe.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:web_components/web_components.dart';


@PolymerRegister('first-issue')
class FirstIssue extends PolymerElement with AutonotifyBehavior, Observable {

  @observable
  @property
  ObservableList<MyData> data;


  FirstIssue.created() : super.created();


  @override
  void attached() {
    data = new ObservableList.from([
      new MyData('Eert', 12),
      new MyData('Wdga', 13),
      new MyData('Grfdg', 14),
    ]);
  }

  @reflectable
  void btrRemove_click(Event e, [_]) {
    var item = new DomRepeatModel.fromEvent(e)["item"] as MyData;
    data.remove(item);
  }
}