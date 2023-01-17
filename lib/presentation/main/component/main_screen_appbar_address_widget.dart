import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';

import '../../../app/i18n/app_string.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_style.dart';
import '../../../app/util/enum.dart';
import '../../common/spacer_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_helper.dart';
import '../controller/main_screen_bloc.dart';

class MainScreenAppbarAddressWidget extends StatelessWidget {
  const MainScreenAppbarAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppSize.height0_05,
      toolbarHeight: AppSize.height0_05,
      backgroundColor: AppColor.primaryLight,
      floating: false,
      elevation: AppSize.elevationZero,
      flexibleSpace: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSize.marginWidthDoubleExtraSmall,
        ),
        alignment: UIHelper.alienCenterStart(),
        child: BlocBuilder<MainScreenBloc, MainScreenState>(
          buildWhen: (prev, current) {
            return prev.addressRequestState != current.addressRequestState;
          },
          builder: (context, state) {
            switch (state.addressRequestState) {
              case RequestStateEnum.initializing:
                return _addressLoadingWidget();
              case RequestStateEnum.loading:
                return _addressLoadingWidget();
              case RequestStateEnum.success:
                return _addressWidget(state.address.country);
              case RequestStateEnum.failure:
                return _addressWidget(AppString.unlocated.i18n());
            }
          },
        ),
      ),
    );
  }

  Widget _addressWidget(String address) {
    return SizedBox(
      height: AppSize.height0_05,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppString.deliverTo.i18n(),
            style: AppStyle.textRegular(color: AppColor.blackLight),
          ),
          SpacerWidget(width: AppSize.width0_01),
          Text(
            address,
            style: AppStyle.textMedium(color: AppColor.blackLight),
          ),
        ],
      ),
    );
  }

  Widget _addressLoadingWidget() {
    return SizedBox(
      height: AppSize.width0_03,
      width: AppSize.width0_03,
      child: const CupertinoActivityIndicator(color: AppColor.black),
    );
  }
}
