@HtmlImport('my_viewer.html')
library autonitify_issues.my_viewer;

import 'package:autonitify_issues/main_app.dart';
import 'package:observe/observe.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:web_components/web_components.dart';


@PolymerRegister('my-viewer')
class MyViewer extends PolymerElement with AutonotifyBehavior, Observable {

  @observable
  @property
  MyData selected;


  MyViewer.created() : super.created();
}