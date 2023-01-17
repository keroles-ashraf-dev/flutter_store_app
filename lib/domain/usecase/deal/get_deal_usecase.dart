import 'package:dartz/dartz.dart';
import '../../../app/error/failure.dart';
import 'package:store/domain/entity/deal.dart';
import 'package:store/domain/entity/get_deal_request.dart';
import 'package:store/domain/repository/base_deal_repository.dart';

import '../base/base_usecase.dart';

class GetDealUsecase extends BaseUsecase<Deal, GetDealRequest> {
  final BaseDealRepository _dealRepository;

  GetDealUsecase(this._dealRepository);

  @override
  Future<Either<Failure, Deal>> call(GetDealRequest params) async {
    return await _dealRepository.getDeal(params);
  }
}
