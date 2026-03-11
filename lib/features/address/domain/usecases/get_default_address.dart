import '../entities/address.dart';
import '../repositories/address_repository.dart';

class GetDefaultAddress {
  final AddressRepository repository;

  GetDefaultAddress(this.repository);

  Future<Address?> call() {
    return repository.fetchDefaultAddress();
  }
}
