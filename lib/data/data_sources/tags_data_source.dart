import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/data/models/tag.dart';
import 'package:stackoverflow_client/data/models/tags_response.dart';
import 'package:stackoverflow_client/presentaion/managers/utils.dart';
import 'package:stackoverflow_client/res/constants.dart';

@RegisterAs(TagsDataSource)
@singleton
class TagsDataSourceImpl implements TagsDataSource {
  final Dio _dio;

  TagsDataSourceImpl(this._dio);

  @override
  Future<List<Tag>> loadTags(
    int page, {
    int pagesize = chunkSize,
    String order = 'desc',
    String sort = 'popular',
    String site = 'stackoverflow',
  }) async {
    try {
      final response = await _dio.get(
        '/2.2/tags?page=$page'
        '&pagesize=$pagesize'
        '&order=$order'
        '&sort=$sort'
        '&site=$site',
      );
      return TagsResponse.fromJson(response.data).items;
    } on DioError catch (ex) {
      throw Exception(getMessageFromDioEx(ex));
    }
  }
}

abstract class TagsDataSource {
  Future<List<Tag>> loadTags(
    int page, {
    int pagesize = 20,
    String order = 'desc',
    String sort = 'popular',
    String site = 'stackoverflow',
  });
}
