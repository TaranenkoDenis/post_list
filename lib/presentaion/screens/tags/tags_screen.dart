import 'package:flutter/material.dart';
import 'package:stackoverflow_client/data/models/tag.dart';
import 'package:stackoverflow_client/presentaion/common/base_view_state.dart';
import 'package:stackoverflow_client/presentaion/managers/router.gr.dart';
import 'package:stackoverflow_client/presentaion/screens/tags/tags_view_model.dart';
import 'package:stackoverflow_client/presentaion/widgets/divider.dart';
import 'package:stackoverflow_client/presentaion/widgets/infinity_list.dart';
import 'package:stackoverflow_client/res/images.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({Key key}) : super(key: key);

  @override
  _TagsScreenState createState() => _TagsScreenState();
}

class _TagsScreenState
    extends ViewStateWithViewModel<TagsViewModel, TagsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Tags'),
        ),
        body: InfinityList(
          itemBuilder: (ctx, tag) {
            if (tag is Tag) {
              return ListTile(
                onTap: () => Navigator.of(context).pushNamed(
                  Router.questionsScreen,
                  arguments: QuestionsScreenArguments(tag: tag.name),
                ),
                trailing: getDesc(tag.name),
                title: Text(
                  tag.name,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  'Number of questions: ${tag.count}',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              );
            }
            print('Unexpected type of item.');
            return const SizedBox.shrink();
          },
          controller: InfinityListController(viewModel.loadPage),
          separatorBuilder: (_, __) => const DividerCustom(),
        ),
      );

  Widget getDesc(String tagName) {
    String descUrl;

    final tagNameUpper = tagName.toUpperCase();
    if (tagNameUpper == 'IOS') {
      descUrl = appleLogo;
    } else if (tagNameUpper == 'ANDROID') {
      descUrl = androidLogo;
    }

    return descUrl != null ? Image.asset(descUrl, width: 50) : null;
  }
}
