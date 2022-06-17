import 'package:bookque/common/styles.dart';
import 'package:bookque/data/models/full_items.dart';
import 'package:bookque/data/models/poster.dart';
import 'package:bookque/presentation/provider/detail_items_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/detail/bookmark_button.dart';
import 'package:bookque/presentation/widgets/detail/container_detail_categories_item.dart';
import 'package:bookque/presentation/widgets/detail/detail_categories_item.dart';
import 'package:bookque/presentation/widgets/detail/report_dialog.dart';
import 'package:bookque/presentation/widgets/detail/small_button.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/state_enum.dart';
import '../../widgets/detail/detail_data_prov_pages.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<DetailItemsProvider>(context, listen: false)
          ..fetchDetailItemById(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Detail',
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.report,
            size: 28,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ReportDialog();
                });
          },
        )
      ],
      child: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Consumer<DetailItemsProvider>(
              builder: (context, value, _) {
                if (value.stateDetailItems == ResultState.loading) {
                  return const Text('Loading');
                } else if (value.stateDetailItems == ResultState.hasData &&
                    value.dataDetailItems.containsKey(widget.id)) {
                  return DetailDataProvPages(
                      item: value.dataDetailItems[widget.id] ?? FullItems());
                } else if (value.stateDetailItems == ResultState.error) {
                  return Text(value.detailItemsMessage);
                }
                return const Text('Loading');
              },
            ),
          ),
        ),
      ),
    );
  }
}
