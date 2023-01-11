import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/get_deal_request.dart';
import 'package:store/presentation/deal/component/deal_screen_builder_widget.dart';
import 'package:store/presentation/deal/controller/deal_screen_bloc.dart';

import '../../../core/util/app_module.dart';
import '../../../core/util/size_manager.dart';
import '../../common/sub_appbar_widget.dart';

class DealScreen extends StatelessWidget {
  DealScreen({Key? key}) : super(key: key);
  late final int id;

  @override
  Widget build(BuildContext context) {
    _getArgs(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(AppSize.width, AppSize.subAppbarHeight),
          child: const SubAppbarWidget()),
      body: BlocProvider<DealScreenBloc>(
        create: (context) {
          return di<DealScreenBloc>()
            ..add(DealScreenGetDealDataEvent(GetDealRequest(id: id)));
        },
        child: SizedBox(
          height: AppSize.height,
          width: AppSize.width,
          child: const DealScreenBuilderWidget(),
        ),
      ),
    ));
  }

  /// get passed arguments
  void _getArgs(BuildContext context) {
    final RouteSettings? settings = ModalRoute.of(context)?.settings;
    if (settings == null) return;

    final args = settings.arguments as Map<String, dynamic>;

    id = args['id'];
  }
}
