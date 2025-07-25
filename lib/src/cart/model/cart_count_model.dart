import 'dart:convert';

CartCount cartCountFromJson(String str) => CartCount.fromJson(json.decode(str));

String cartCountToJson(CartCount data) => json.encode(data.toJson());

class CartCount {
    final int cartCount;

    CartCount({
        required this.cartCount,
    });

    factory CartCount.fromJson(Map<String, dynamic> json) => CartCount(
        cartCount: json["cart_count"]??0,
    );

    Map<String, dynamic> toJson() => {
        "cart_count": cartCount,
    };
}
