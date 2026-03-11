import '../entities/create_address.dart';
import '../repositories/address_repository.dart';

class AddAddress {
  final AddressRepository repository;

  AddAddress(this.repository);

  Future<void> call(CreateAddress address) {
    return repository.addAddress(address);
  }
}
