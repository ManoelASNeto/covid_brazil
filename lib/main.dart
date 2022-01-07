import 'package:covid_brazil/core/navigations/router.dart';
import 'package:covid_brazil/core/navigations/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      onGenerateRoute: _router.generateRoute,
      initialRoute: Routes.homePage,
      navigatorObservers: [HeroController()],
    );
  }
}
