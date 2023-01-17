import 'package:dartz/dartz.dart';
import '../../../app/error/failure.dart';
import 'package:store/domain/entity/address.dart';
import 'package:store/domain/entity/get_address_request.dart';
import 'package:store/domain/repository/base_address_repository.dart';

import '../base/base_usecase.dart';

class GetAddressUsecase extends BaseUsecase<Address, GetAddressRequest> {
  final BaseAddressRepository _addressRepository;

  GetAddressUsecase(this._addressRepository);

  @override
  Future<Either<Failure, Address>> call(GetAddressRequest params) async {
    return await _addressRepository.getAddress(params);
  }
}
