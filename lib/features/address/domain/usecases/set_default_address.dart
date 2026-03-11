import '../repositories/address_repository.dart';

class SetDefaultAddress {
  final AddressRepository repository;

  SetDefaultAddress(this.repository);

  Future<void> call(int id) {
    return repository.setDefaultAddress(id);
  }
}
