import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/providers/providers.dart';
import 'app/routes/routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DeciderRoute,
      routes: routes,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
