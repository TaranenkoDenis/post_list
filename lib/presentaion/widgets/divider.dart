import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.black.withOpacity(0.3),
      );
}
