import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/util/di.dart';
import 'package:store/presentation/deal/controller/deal_screen_bloc.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/util/size_manager.dart';
import '../../common/sub_appbar_widget.dart';

class DealScreen extends StatelessWidget {
  const DealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(AppSize.width, AppSize.subAppbarHeight),
          child: SubAppbarWidget(title: AppString.language.i18n())),
      body: BlocProvider<DealScreenBloc>(
        create: (context) => di<DealScreenBloc>(),
        child: Container(),
      ),
    ));
  }
}
