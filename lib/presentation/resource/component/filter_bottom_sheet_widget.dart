import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/domain/entity/filter.dart';
import 'package:store/presentation/resource/component/elevated_btn_widget.dart';
import 'package:store/presentation/resource/component/spacer_widget.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/util/enum.dart';
import '../size_manager.dart';
import 'radio_tile_widget.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  final Filter filter;

  const FilterBottomSheetWidget({
    Key? key,
    required this.filter,
  }) : super(key: key);

  @override
  State<FilterBottomSheetWidget> createState() =>
      _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  late FilterSortByEnum _sortBySelected;
  late FilterOrderByEnum _orderBySelected;

  @override
  void initState() {
    super.initState();
    _sortBySelected = widget.filter.sortBy;
    _orderBySelected = widget.filter.orderBy;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.marginHeightDoubleExtraSmall,
        horizontal: AppSize.marginWidthExtraSmall,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.sortBy.i18n()),
            SpacerWidget(
              height: AppSize.height0_01,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: FilterSortByEnum.values.length,
              itemBuilder: (context, i) {
                return RadioTaleWidget(
                  title: FilterSortByEnum.values[i].name.i18n(),
                  value: FilterSortByEnum.values[i],
                  groupValue: _sortBySelected,
                  onChanged: (val) {
                    if (val != null) setState(() => _sortBySelected = val);
                  },
                );
              },
            ),
            const Divider(),
            Text(AppString.orderBy.i18n()),
            SpacerWidget(
              height: AppSize.height0_01,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: FilterOrderByEnum.values.length,
              itemBuilder: (context, i) {
                return RadioTaleWidget(
                  padding: EdgeInsets.symmetric(vertical: AppSize.height0_01),
                  title: FilterOrderByEnum.values[i].name.i18n(),
                  value: FilterOrderByEnum.values[i],
                  groupValue: _orderBySelected,
                  onChanged: (val) {
                    if (val != null) setState(() => _orderBySelected = val);
                  },
                );
              },
            ),
            const Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedBtnWidget(
                  width: AppSize.width3,
                  text: AppString.save,
                  action: () => _save(),
                ),
                ElevatedBtnWidget(
                  width: AppSize.width3,
                  text: AppString.cancel,
                  action: () => _cancel(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _save() async {
    final filter = Filter(sortBy: _sortBySelected, orderBy: _orderBySelected);
    AppNavigator.pop(context, result: filter);
  }

  Future<dynamic> _cancel() async {
    AppNavigator.pop(context, result: null);
  }
}
