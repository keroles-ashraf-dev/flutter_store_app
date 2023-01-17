import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../entity/category.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure, List<Category>>> getMainCategories();
}
