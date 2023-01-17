import 'package:dartz/dartz.dart';
import '../../../app/error/failure.dart';
import 'package:store/domain/repository/base_category_repository.dart';

import '../../entity/category.dart';
import '../../entity/no_param.dart';
import '../base/base_usecase.dart';

class GetMainCategoriesUsecase extends BaseUsecase<List<Category>, NoParams> {
  final BaseCategoryRepository _categoryRepository;

  GetMainCategoriesUsecase(this._categoryRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _categoryRepository.getMainCategories();
  }
}
