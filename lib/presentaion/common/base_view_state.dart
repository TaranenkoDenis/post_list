import 'package:flutter/material.dart';
import 'package:stackoverflow_client/di/injection.dart';

import 'base_view_model.dart';

abstract class ViewStateWithViewModel<ViewModel extends BaseViewModel,
    View extends StatefulWidget> extends State<View> {
  final ViewModel viewModel = getIt<ViewModel>();

  @override
  void initState() {
    super.initState();

    viewModel.errorEvents.listen(
      (errorMsg) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(errorMsg),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
