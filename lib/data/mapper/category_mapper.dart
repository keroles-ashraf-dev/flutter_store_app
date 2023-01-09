import '../../domain/entity/category.dart';
import '../model/category_model.dart';

extension CategoryModelMapper on CategoryModel {
  Category get toEntity {
    return Category(
      id: id,
      name: name,
      image: image,
    );
  }
}

extension CategoryMapper on Category {
  CategoryModel get toModel {
    return CategoryModel(
      id: id,
      name: name,
      image: image,
    );
  }
}
