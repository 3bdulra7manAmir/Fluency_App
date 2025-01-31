import 'package:flutter/material.dart';

class BottomCircularClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size)
  {
    Path path = Path();
    path.lineTo(0, size.height - 50); // بداية القطع قبل الدائرة

    // إنشاء منحنى دائري أسفل الصورة
    path.quadraticBezierTo(
      size.width / 2, size.height + 50, // نقطة التحكم في المنحنى
      size.width, size.height - 50, // نهاية المنحنى
    );

    path.lineTo(size.width, 0); // إغلاق المسار
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}