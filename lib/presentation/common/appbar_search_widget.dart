import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../app/i18n/app_string.dart';
import '../../app/theme/app_color.dart';
import '../resource/size_manager.dart';

class AppbarSearchWidget extends StatelessWidget {
  const AppbarSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppSize.height0_07,
      pinned: true,
      backgroundColor: AppColor.primary,
      title: Container(
        height: AppSize.height0_06,
        margin: EdgeInsets.symmetric(
            horizontal: AppSize.marginWidthTripleExtraSmall,
            ),
        alignment: Alignment.center,
        child: TextField(

          textAlign: TextAlign.justify,
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
            hintText: AppString.searchHint.i18n(),
            prefixIcon: const Icon(Icons.search, color: AppColor.blackLight),
            // suffixIcon: _searchText.isNotEmpty
            //     ? InkWell(
            //         onTap: () {
            //           // _searchController.clear();
            //           // setState(() {
            //           //   _filteredServices.clear();
            //           //   _searchText = "";
            //           // });
            //         },
            //         child: const Icon(Icons.clear),
            //       )
            //     :
            //null,
          ).applyDefaults(
            Theme.of(context).inputDecorationTheme.copyWith(
                  fillColor: AppColor.whiteLight,
                  filled: true,
                ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onChanged: (value) {},
          onSubmitted: (value) {
            if (value.isNotEmpty) {}
          },
        ),
      ),
    );
  }
}
