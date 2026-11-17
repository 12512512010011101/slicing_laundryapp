import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Memuat ikon SVG dari assets/icons/<name>.svg.
/// Isi [color] untuk mewarnai ikon; kosongkan untuk ikon berwarna (mis. Google).
Widget svgIcon(String name, {double size = 22, Color? color}) {
  return SvgPicture.asset(
    'assets/icons/$name.svg',
    width: size,
    height: size,
    colorFilter:
        color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
  );
}