import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String time;
  const NotificationCard({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(Assets.images.imgLogoIcon.path),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(time),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
