import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/data/data_sources/questions_data_source.dart';
import 'package:stackoverflow_client/data/models/question.dart';

@RegisterAs(QuestionsInteractor)
@singleton
class QuestionsInteractorImpl implements QuestionsInteractor {
  final QuestionsDataSource _questionsDataSource;
  QuestionsInteractorImpl(this._questionsDataSource);

  @override
  Future<List<Question>> loadQuestions(String tag, int page) =>
      _questionsDataSource.loadQuestions(tag, page);
}

abstract class QuestionsInteractor {
  Future<List<Question>> loadQuestions(String tag, int page);
}
