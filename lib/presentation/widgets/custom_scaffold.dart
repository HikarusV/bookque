import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {Key? key, this.title = 'Title', this.child, this.actions})
      : super(key: key);
  final String title;
  final Widget? child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(title, style: appBarTitle),
        elevation: 0,
        actions: actions,
      ),
      body: child ?? Container(),
    );
  }
}
