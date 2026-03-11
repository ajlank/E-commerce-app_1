import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:flutter/material.dart';

class FetchDefaultAddressResult {
  final Address? address;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchDefaultAddressResult({
    required this.address,
    required this.refetch,
    required this.isLoading,
    required this.error});
}
