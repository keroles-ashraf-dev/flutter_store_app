import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/deal.dart';
import 'package:store/domain/entity/get_deal_request.dart';

import '../../app/error/failure.dart';

abstract class BaseDealRepository {
  Future<Either<Failure, List<Deal>>> getDeals();

  Future<Either<Failure, Deal>> getDeal(GetDealRequest request);
}
