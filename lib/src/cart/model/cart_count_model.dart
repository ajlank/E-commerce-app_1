import 'dart:convert';

CartCount cartCountFromJson(String str) => CartCount.fromJson(json.decode(str));

String cartCountToJson(CartCount data) => json.encode(data.toJson());

class CartCount {
    final int cartCount;

    CartCount({
        required this.cartCount,
    });

    factory CartCount.fromJson(Map<String, dynamic> json) => CartCount(
        cartCount: json["cart-count"],
    );

    Map<String, dynamic> toJson() => {
        "cart-count": cartCount,
    };
}
