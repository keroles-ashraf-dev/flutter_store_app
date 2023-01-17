import 'package:dartz/dartz.dart';
import '../../../app/error/failure.dart';
import 'package:store/domain/entity/deal.dart';
import 'package:store/domain/repository/base_deal_repository.dart';

import '../../entity/no_param.dart';
import '../base/base_usecase.dart';

class GetDealsUsecase extends BaseUsecase<List<Deal>, NoParams> {
  final BaseDealRepository _dealRepository;

  GetDealsUsecase(this._dealRepository);

  @override
  Future<Either<Failure, List<Deal>>> call(NoParams params) async {
    return await _dealRepository.getDeals();
  }
}
