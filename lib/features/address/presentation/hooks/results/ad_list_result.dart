import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:flutter/material.dart';

class FetchAddressListResult {
  final List<Address> address;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchAddressListResult({
    required this.address,
    required this.refetch,
    required this.isLoading,
    required this.error});
}
