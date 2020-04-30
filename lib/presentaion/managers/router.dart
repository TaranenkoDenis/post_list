import 'package:auto_route/auto_route_annotations.dart';
import 'package:stackoverflow_client/presentaion/screens/questions_by_tag/questions_screen.dart';
import 'package:stackoverflow_client/presentaion/screens/tags/tags_screen.dart';

@autoRouter
class $Router {
  @initial
  @MaterialRoute()
  TagsScreen tagsScreen;

  @MaterialRoute()
  QuestionsScreen questionsScreen;
}
