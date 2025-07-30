import 'package:fashionapp/src/addresses2/models/addresses_model2.dart';
import 'package:flutter/material.dart';

class FetchAddressListResult {

  final List<AddressModel> address;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
  
  FetchAddressListResult({
    required this.address,
    required this.refetch, 
    required this.isLoading,
    required this.error});

}