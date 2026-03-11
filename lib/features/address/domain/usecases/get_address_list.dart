import '../entities/address.dart';
import '../repositories/address_repository.dart';

class GetAddressList {
  final AddressRepository repository;

  GetAddressList(this.repository);

  Future<List<Address>> call() {
    return repository.fetchAddressList();
  }
}
