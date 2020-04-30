import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/data/models/tag.dart';
import 'package:stackoverflow_client/domain/tags_interactor.dart';
import 'package:stackoverflow_client/presentaion/common/base_view_model.dart';

@RegisterAs(TagsViewModel)
@injectable
class TagsViewModelImpl extends BaseViewModelImpl implements TagsViewModel {
  final TagsInteractor _tagsInteractor;

  TagsViewModelImpl(this._tagsInteractor);

  @override
  Future<List<Tag>> loadPage(int page) => _tagsInteractor
      .loadTags(page)
      .catchError((e) => errorEventsSink.add(e.toString()));
}

abstract class TagsViewModel extends BaseViewModel {
  Future<List<Tag>> loadPage(int page);
}
