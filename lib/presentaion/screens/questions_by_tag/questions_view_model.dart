import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/data/models/question.dart';
import 'package:stackoverflow_client/domain/questions_interactor.dart';
import 'package:stackoverflow_client/presentaion/common/base_view_model.dart';

@RegisterAs(QuestionsViewModel)
@injectable
class QuestionsViewModelImpl extends BaseViewModelImpl
    implements QuestionsViewModel {
  final QuestionsInteractor _questionsInteractor;

  QuestionsViewModelImpl(this._questionsInteractor);

  @override
  Future<List<Question>> loadQuestions(String tag, int page) =>
      _questionsInteractor
          .loadQuestions(tag, page)
          .catchError((e) => errorEventsSink.add(e.toString()));
}

abstract class QuestionsViewModel extends BaseViewModel {
  Future<List<Question>> loadQuestions(String tag, int page);
}
