class CreateAddress {
  final double lat;
  final double lan;
  final bool isDefault;
  final String address;
  final String phone;
  final String addressType;

  const CreateAddress({
    required this.lat,
    required this.lan,
    required this.isDefault,
    required this.address,
    required this.phone,
    required this.addressType,
  });
}
