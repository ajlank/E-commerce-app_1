class CreateCart {
  const CreateCart({
    required this.product,
    required this.quantity,
    required this.size,
    required this.color,
  });

  final int product;
  final int quantity;
  final String size;
  final String color;
}
