@HtmlImport('my_selector.html')
library autonitify_issues.my_selector;

import 'dart:async';
import 'dart:html';

import 'package:autonitify_issues/main_app.dart';
import 'package:observe/observe.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:web_components/web_components.dart';


@PolymerRegister('my-selector')
class MySelector extends PolymerElement with AutonotifyBehavior, Observable {

  @observable
  @property
  Controller controller;


  MySelector.created() : super.created();


  @reflectable
  void btrSelect1_click(Event e, [_]) {
    controller.selected = controller.data[0];
  }

  @reflectable
  void btrSelect2_click(Event e, [_]) {
    controller.selected = controller.data[1];
  }

  @reflectable
  void btrSelect3_click(Event e, [_]) {
    controller.selected = controller.data[2];
  }

  @reflectable
  void btrBreakIt_click(Event e, [_]) {
    var old = controller.selected;
    controller.selected = controller.data[2];
    old.surname = "Broken!!!";

    // next way doesn't work too.
//    controller.selected.surname = "Broken!!!";
//    controller.selected = controller.data[2];

    print('items right after change: ${controller.data.toList()}');

    new Future(() => print('items a bit later: ${controller.data.toList()}'));
  }
}