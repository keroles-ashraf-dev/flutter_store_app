import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/domain/entity/filter.dart';
import 'package:store/presentation/common/elevated_btn_widget.dart';
import 'package:store/presentation/common/spacer_widget.dart';

import '../../core/navigation/app_navigator.dart';
import '../../core/util/size_manager.dart';

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
                return _sortByRadioListTale(
                  title: FilterSortByEnum.values[i].name.i18n(),
                  value: FilterSortByEnum.values[i],
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
                return _orderByRadioListTale(
                  title: FilterOrderByEnum.values[i].name.i18n(),
                  value: FilterOrderByEnum.values[i],
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

  Widget _sortByRadioListTale(
      {required String title,
      required FilterSortByEnum value,
      required Function onChanged}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.height0_01),
      child: RadioListTile(
        title: Text(title),
        value: value,
        groupValue: _sortBySelected,
        onChanged: (val) => onChanged(val),
      ),
    );
  }

  Widget _orderByRadioListTale(
      {required String title,
      required FilterOrderByEnum value,
      required Function onChanged}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.height0_01),
      child: RadioListTile(
        title: Text(title),
        value: value,
        groupValue: _orderBySelected,
        onChanged: (val) => onChanged(val),
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
