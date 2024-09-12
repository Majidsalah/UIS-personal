import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomToastCard extends StatelessWidget {
  CustomToastCard({super.key, required this.text, this.color});
  final String text;
  Color? color;
  Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ToastCard(
      trailing: trailing,
      color: color,
      title: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
