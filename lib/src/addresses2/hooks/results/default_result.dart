import 'package:fashionapp/src/addresses2/models/addresses_model2.dart';
import 'package:flutter/material.dart';

class FetchDefaultAddress2 {

  final AddressModel? address;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
  FetchDefaultAddress2({
    required this.address,
    required this.refetch, 
    required this.isLoading,
    required this.error});

}