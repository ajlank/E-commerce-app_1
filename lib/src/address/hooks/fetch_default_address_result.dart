
import 'package:fashionapp/src/address/model/address_model.dart';
import 'package:flutter/semantics.dart';

class FetchDefaultAddressResult {
  final AddressModel? address;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchDefaultAddressResult({required this.address, required this.isLoading, required this.error, required this.refetch});
}