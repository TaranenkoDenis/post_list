// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:stackoverflow_client/presentaion/screens/tags/tags_screen.dart';
import 'package:stackoverflow_client/presentaion/screens/questions_by_tag/questions_screen.dart';

class Router {
  static const tagsScreen = '/';
  static const questionsScreen = '/questions-screen';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.tagsScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => TagsScreen(key: typedArgs),
          settings: settings,
        );
      case Router.questionsScreen:
        if (hasInvalidArgs<QuestionsScreenArguments>(args)) {
          return misTypedArgsRoute<QuestionsScreenArguments>(args);
        }
        final typedArgs =
            args as QuestionsScreenArguments ?? QuestionsScreenArguments();
        return MaterialPageRoute(
          builder: (_) =>
              QuestionsScreen(key: typedArgs.key, tag: typedArgs.tag),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//QuestionsScreen arguments holder class
class QuestionsScreenArguments {
  final Key key;
  final String tag;
  QuestionsScreenArguments({this.key, this.tag});
}
