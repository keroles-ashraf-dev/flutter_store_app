import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/get_address_request.dart';

import '../../core/error/failure.dart';
import '../entity/address.dart';

abstract class BaseAddressRepository {
  Future<Either<Failure, Address>> getAddress(GetAddressRequest request);
}
