import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/util/size_manager.dart';

class MoreItemWidget extends StatelessWidget {
  final String title;
  final Widget leading;
  final String route;

  const MoreItemWidget({
    Key? key,
    required this.title,
    required this.leading,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.marginHeightTripleExtraSmall,
      ),
      child: ListTile(
        title: Text(title),
        leading: leading,
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: () => AppNavigator.push(context, route),
      ),
    );
  }
}
