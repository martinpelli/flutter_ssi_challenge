import 'package:fluro/fluro.dart';

import '../people/views/home_view.dart';

class HomeHandler {
  static Handler home = Handler(handlerFunc: (_, __) => HomeView());
}
