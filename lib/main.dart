import 'package:flutter/material.dart';
import 'package:stackoverflow_client/di/injection.dart';
import 'package:stackoverflow_client/presentaion/managers/router.gr.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo Stackoverflow',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            subtitle: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        onGenerateRoute: Router.onGenerateRoute,
        initialRoute: Router.tagsScreen,
      );
}
