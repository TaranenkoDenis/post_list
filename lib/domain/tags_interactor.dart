import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/data/data_sources/tags_data_source.dart';
import 'package:stackoverflow_client/data/models/tag.dart';

@RegisterAs(TagsInteractor)
@singleton
class TagsInteractorImpl implements TagsInteractor {
  final TagsDataSource _tagsDataSource;

  TagsInteractorImpl(this._tagsDataSource);

  @override
  Future<List<Tag>> loadTags(int page) => _tagsDataSource.loadTags(page);
}

abstract class TagsInteractor {
  Future<List<Tag>> loadTags(int page);
}
