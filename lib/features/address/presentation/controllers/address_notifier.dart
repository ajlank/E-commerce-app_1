import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:fashionapp/features/address/domain/entities/create_address.dart';
import 'package:fashionapp/features/address/domain/repositories/address_repository.dart';
import 'package:fashionapp/features/address/domain/usecases/add_address.dart';
import 'package:fashionapp/features/address/domain/usecases/delete_address.dart';
import 'package:fashionapp/features/address/domain/usecases/set_default_address.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressNotifier with ChangeNotifier {
  AddressNotifier({required AddressRepository repository})
      : _addAddress = AddAddress(repository),
        _deleteAddress = DeleteAddress(repository),
        _setDefaultAddress = SetDefaultAddress(repository);

  final AddAddress _addAddress;
  final DeleteAddress _deleteAddress;
  final SetDefaultAddress _setDefaultAddress;

  Address? address;
  Function refetchA = () {};

  void setRefetch(Function r) {
    refetchA = r;
    notifyListeners();
  }

  void setAddress(Address a) {
    address = a;
    notifyListeners();
  }

  void clearAddress() {
    address = null;
    notifyListeners();
  }

  List<String> addressTypes = ['Home', 'School', 'Office'];
  String _addressType = '';

  void setAddressType(String type) {
    _addressType = type;
    notifyListeners();
  }

  String get addressType => _addressType;

  void clearAddressTyoe() {
    _addressType = '';
    notifyListeners();
  }

  bool _defaultToggle = false;

  void setDefaultToggle(bool d) {
    _defaultToggle = d;
    notifyListeners();
  }

  bool get defaultToggle => _defaultToggle;

  void clearDefaultToggle() {
    _defaultToggle = false;
    notifyListeners();
  }

  Future<void> setAsDefault(int id, Function refetch) async {
    try {
      await _setDefaultAddress(id);
      refetch();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addAddress(CreateAddress data, BuildContext context) async {
    try {
      await _addAddress(data);
      refetchA();
      context.pop();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteAddress(int id, Function refetch) async {
    try {
      await _deleteAddress(id);
      refetch();
    } catch (e) {
      print(e.toString());
    }
  }
}
