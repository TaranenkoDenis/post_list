import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/data/models/question.dart';
import 'package:stackoverflow_client/data/models/questions_response.dart';
import 'package:stackoverflow_client/presentaion/managers/utils.dart';
import 'package:stackoverflow_client/res/constants.dart';

@RegisterAs(QuestionsDataSource)
@singleton
class QuestionsDataSourceImpl implements QuestionsDataSource {
  final Dio _dio;

  QuestionsDataSourceImpl(this._dio);

  @override
  Future<List<Question>> loadQuestions(
    String tag,
    int page, {
    int pageSize = chunkSize,
    String order = 'desc',
    String sort = 'creation',
    String site = 'stackoverflow',
  }) async {
    try {
      final response = await _dio.get(
        '/2.2/questions?page=1'
        '&pagesize=$pageSize'
        '&order=$order'
        '&sort=$sort'
        '&tagged=$tag'
        '&site=$site',
      );
      return QuestionsResponse.fromJson(response.data).items;
    } on DioError catch (ex) {
      throw Exception(getMessageFromDioEx(ex));
    }
  }
}

abstract class QuestionsDataSource {
  Future<List<Question>> loadQuestions(String tag, int page);
}
