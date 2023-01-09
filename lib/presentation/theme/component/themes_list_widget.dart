import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/theme/app_theme.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

class ThemesListWidget extends StatelessWidget {
  final ThemeEnum selectedTheme;

  const ThemesListWidget({Key? key, required this.selectedTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ThemeEnum.values.length,
      itemBuilder: (context, i) {
        return Container(
          margin:  EdgeInsets.symmetric(vertical: AppSize.marginHeightTripleExtraSmall),
          child: ListTile(
            selected: ThemeEnum.values[i] == selectedTheme,
            title: Text(ThemeEnum.values[i].name.i18n(), textAlign: TextAlign.center),
            onTap: () => _changeSelectedTheme(context, ThemeEnum.values[i]),
          ),
        );
      },
    );
  }

  /// theme list tile on tap
  void _changeSelectedTheme(BuildContext context, ThemeEnum theme) {
    BlocProvider.of<ThemeScreenBloc>(context).add(ThemeScreenChangeEvent(theme));
  }
}
