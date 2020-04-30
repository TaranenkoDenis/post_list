import 'package:flutter/material.dart';
import 'package:stackoverflow_client/data/models/question.dart';
import 'package:stackoverflow_client/presentaion/common/base_view_state.dart';
import 'package:stackoverflow_client/presentaion/screens/questions_by_tag/questions_view_model.dart';
import 'package:stackoverflow_client/presentaion/widgets/divider.dart';
import 'package:stackoverflow_client/presentaion/widgets/infinity_list.dart';
import 'package:stackoverflow_client/res/images.dart';

class QuestionsScreen extends StatefulWidget {
  final String tag;
  const QuestionsScreen({Key key, this.tag}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState
    extends ViewStateWithViewModel<QuestionsViewModel, QuestionsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.tag),
          automaticallyImplyLeading: true,
        ),
        body: InfinityList(
          itemBuilder: (ctx, question) {
            if (question is Question) {
              final dateTime = DateTime.fromMillisecondsSinceEpoch(
                  question.creationDate * 1000);

              final textTheme = Theme.of(context).textTheme;
              final subtitle1 = textTheme.title;
              final subtitle2 = textTheme.subtitle;

              return Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(question.title, style: subtitle1),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Number of answers: ${question.answerCount}',
                        style: subtitle2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        FadeInImage.assetNetwork(
                          placeholder: avatarPlaceholder,
                          image: question.owner.profileImage ?? '',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            question.owner.displayName,
                            style: subtitle2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(formateDate(dateTime), style: subtitle2),
                      ],
                    )
                  ],
                ),
              );
            }
            print('Unexpected type of item.');
            return const SizedBox.shrink();
          },
          controller: InfinityListController(
            (page) => viewModel.loadQuestions(widget.tag, page),
          ),
          separatorBuilder: (_, __) => const DividerCustom(),
        ),
      );

  // Here I could use a special plugin to format the string,
  // but it is too redundant only fot this case.
  String formateDate(DateTime dateTime) {
    final month = formatValueWithZero(dateTime.month);
    final day = formatValueWithZero(dateTime.day);

    final hour = formatValueWithZero(dateTime.hour);
    final minute = formatValueWithZero(dateTime.minute);
    final second = formatValueWithZero(dateTime.second);

    return '${dateTime.year}-$month-$day $hour:$minute:$second';
  }

  String formatValueWithZero(int value) => value >= 10 ? '$value' : '0${value}';
}
