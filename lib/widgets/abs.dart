import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Gaya teks Poppins.
TextStyle ts(double size, FontWeight w, Color c, {double? ls}) => TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: w,
      color: c,
      letterSpacing: ls,
      height: 1.2,
    );

/// Ikon SVG dengan ukuran asli (tidak melar).
Widget ico(String name, double w, double h) =>
    SvgPicture.asset('assets/icons/$name.svg', width: w, height: h);

/// Taruh [child] dengan sisi kiri di [left] dan titik tengah vertikal di [cy].
Widget at(double left, double cy, Widget child, {double h = 24}) => Positioned(
      left: left,
      top: cy - h / 2,
      height: h,
      child: Align(alignment: Alignment.centerLeft, child: child),
    );

/// Kotak putih bergaris tepi (kartu).
BoxDecoration cardBox({double radius = 12, Color color = Colors.white}) =>
    BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: const Color(0xFFEAEDF5)),
    );

/// Halaman 360 px dengan koordinat absolut, bisa di-scroll.
class AbsPage extends StatelessWidget {
  final double height;
  final List<Widget> children;
  const AbsPage({super.key, required this.height, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 360,
          height: height,
          child: Stack(clipBehavior: Clip.none, children: children),
        ),
      ),
    );
  }
}

Widget pageTitle(String text, {double cx = 180}) => Positioned(
      left: 0,
      right: 0,
      top: 47,
      child: Center(child: Text(text, style: ts(20, FontWeight.w600, Colors.black))),
    );
