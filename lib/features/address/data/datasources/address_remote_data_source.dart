import 'package:fashionapp/common/models/api_error_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/address_model.dart';
import '../models/create_address_model.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> fetchAddressList();
  Future<AddressModel?> fetchDefaultAddress();
  Future<void> addAddress(CreateAddressModel data);
  Future<void> deleteAddress(int id);
  Future<void> setDefaultAddress(int id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  AddressRemoteDataSourceImpl({required this.client, required this.storage});

  final http.Client client;
  final GetStorage storage;

  String? get _token => storage.read('accessToken');

  Map<String, String> _headers(String token) => {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      };

  @override
  Future<List<AddressModel>> fetchAddressList() async {
    final token = _token;
    if (token == null) {
      throw Exception('Missing access token');
    }
    final url = Uri.parse('http://192.168.0.106:8000/api/address/addresslist');
    final response = await client.get(url, headers: _headers(token));
    if (response.statusCode == 200) {
      return addressListFromJson(response.body);
    }
    throw Exception('Failed to fetch address list');
  }

  @override
  Future<AddressModel?> fetchDefaultAddress() async {
    final token = _token;
    if (token == null) {
      return null;
    }
    final url = Uri.parse('http://192.168.0.106:8000/api/address/me/');
    final response = await client.get(url, headers: _headers(token));
    if (response.statusCode == 200) {
      return addressDefaultFromJson(response.body);
    }
    return null;
  }

  @override
  Future<void> addAddress(CreateAddressModel data) async {
    final token = _token;
    if (token == null) {
      throw Exception('Missing access token');
    }
    final url = Uri.parse('http://192.168.0.106:8000/api/address/add/');
    final response = await client.post(
      url,
      headers: _headers(token),
      body: createAddressToJson(data),
    );
    if (response.statusCode == 201) {
      return;
    }
    if (response.statusCode == 404 || response.statusCode == 400) {
      final data = apiErrorFromJson(response.body);
      throw Exception('API error: $data');
    }
    throw Exception('Failed to add address');
  }

  @override
  Future<void> deleteAddress(int id) async {
    final token = _token;
    if (token == null) {
      throw Exception('Missing access token');
    }
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/address/delete/?id=$id',
    );
    final response = await client.delete(url, headers: _headers(token));
    if (response.statusCode == 200) {
      return;
    }
    if (response.statusCode == 404 || response.statusCode == 400) {
      final data = apiErrorFromJson(response.body);
      throw Exception('API error: $data');
    }
    throw Exception('Failed to delete address');
  }

  @override
  Future<void> setDefaultAddress(int id) async {
    final token = _token;
    if (token == null) {
      throw Exception('Missing access token');
    }
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/address/default/?id=$id',
    );
    final response = await client.patch(url, headers: _headers(token));
    if (response.statusCode == 201) {
      return;
    }
    if (response.statusCode == 404 || response.statusCode == 400) {
      final data = apiErrorFromJson(response.body);
      throw Exception('API error: $data');
    }
    throw Exception('Failed to set default address');
  }
}
