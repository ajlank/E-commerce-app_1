class Address {
  final int id;
  final double lat;
  final double lan;
  final bool isDefault;
  final String address;
  final String phone;
  final String addressType;
  final int userId;

  const Address({
    required this.id,
    required this.lat,
    required this.lan,
    required this.isDefault,
    required this.address,
    required this.phone,
    required this.addressType,
    required this.userId,
  });
}
