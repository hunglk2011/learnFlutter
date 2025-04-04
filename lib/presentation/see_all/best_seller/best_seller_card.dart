import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_reserve_button.dart';

class BestSellerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int? reviewCount;
  final VoidCallback? onPressed;

  const BestSellerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onPressed,
    this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 327,
        height: 130,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(3, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imagePath,
                width: 100,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        reviewCount!,
                        (index) =>
                            const Icon(Icons.star, color: Colors.red, size: 10),
                      ),
                      const SizedBox(width: 4),
                      const Spacer(),
                      UIReserveButton(
                        text: "Reserve",
                        onPressed: onPressed,
                        title: '',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
