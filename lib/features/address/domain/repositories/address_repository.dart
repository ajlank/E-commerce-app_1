import '../entities/address.dart';
import '../entities/create_address.dart';

abstract class AddressRepository {
  Future<List<Address>> fetchAddressList();
  Future<Address?> fetchDefaultAddress();
  Future<void> addAddress(CreateAddress address);
  Future<void> deleteAddress(int id);
  Future<void> setDefaultAddress(int id);
}
