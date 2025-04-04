import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/home/home_component/reserve_button.dart';

class ProductCard extends StatelessWidget {
  final String nameProduct;
  final String address;
  final String? image;
  final VoidCallback? onchanged;

  const ProductCard({
    super.key,
    required this.nameProduct,
    required this.address,
    this.image,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222,
      width: 152,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              image ?? "",
              width: 152,
              height: 124,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    nameProduct,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff483332),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.place_rounded, size: 14),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        address,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                ReserveButton(text: "Reserve", onPressed: onchanged),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
