import '../repositories/address_repository.dart';

class DeleteAddress {
  final AddressRepository repository;

  DeleteAddress(this.repository);

  Future<void> call(int id) {
    return repository.deleteAddress(id);
  }
}
