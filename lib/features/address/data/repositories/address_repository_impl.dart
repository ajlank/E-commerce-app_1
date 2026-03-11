import '../../domain/entities/address.dart';
import '../../domain/entities/create_address.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_remote_data_source.dart';
import '../models/create_address_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl({required this.remoteDataSource});

  final AddressRemoteDataSource remoteDataSource;

  @override
  Future<List<Address>> fetchAddressList() async {
    final models = await remoteDataSource.fetchAddressList();
    return List<Address>.from(models);
  }

  @override
  Future<Address?> fetchDefaultAddress() async {
    return remoteDataSource.fetchDefaultAddress();
  }

  @override
  Future<void> addAddress(CreateAddress address) async {
    final model = CreateAddressModel.fromEntity(address);
    return remoteDataSource.addAddress(model);
  }

  @override
  Future<void> deleteAddress(int id) async {
    return remoteDataSource.deleteAddress(id);
  }

  @override
  Future<void> setDefaultAddress(int id) async {
    return remoteDataSource.setDefaultAddress(id);
  }
}
