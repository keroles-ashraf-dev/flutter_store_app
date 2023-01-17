import 'package:equatable/equatable.dart';

import '../../app/util/app_constant.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;

  const Category({required this.id, required this.name, required this.image});

  /// return empty object
  const Category.empty({
    this.id = AppConstant.emptyInt,
    this.name = AppConstant.emptyStr,
    this.image = AppConstant.emptyStr,
  });

  @override
  List<Object> get props => [id, name, image];
}
