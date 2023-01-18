import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/get_address_request.dart';
import 'package:store/presentation/main/component/main_screen_content.dart';
import 'package:store/presentation/main/controller/main_screen_bloc.dart';

import '../../../app/debug/function.dart';
import '../../../app/service_locator/service_locator.dart';
import '../../../app/session/session.dart';
import '../../common/appbar_search_widget.dart';
import '../component/main_screen_appbar_address_widget.dart';
import '../component/main_screen_bottom_navbar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('main screen build');
    return BlocProvider<MainScreenBloc>(
      create: (context) {
        return sl<MainScreenBloc>()
          ..add(MainScreenGetDefaultAddressEvent(
            GetAddressRequest(id: sl<Session>().user.defaultAddressId),
          ));
      },
      child: SafeArea(
        child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool _) {
                return <Widget>[
                  const AppbarSearchWidget(),
                  const MainScreenAppbarAddressWidget()
                ];
              },
              body: const MainScreenContent(),
            ),
            bottomNavigationBar: const MainScreenBottomNavbarWidget()),
      ),
    );
  }
}
