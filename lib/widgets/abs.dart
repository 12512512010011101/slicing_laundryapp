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
  child: Center(
    child: Text(text, style: ts(20, FontWeight.w600, Colors.black)),
  ),
);

// ====== tambahan untuk layar form / alamat / keamanan ======

// ---------------------------------------------------------------------------
// Tambahan untuk layar non-tab (Edit profil, Keamanan, Alamat, dst.)
// ---------------------------------------------------------------------------

/// Halaman dengan tombol kembali + judul di tengah.
class SubPage extends StatelessWidget {
  final String title;
  final double height;
  final List<Widget> children;
  const SubPage({
    super.key,
    required this.title,
    required this.children,
    this.height = 800,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        top: false,
        child: AbsPage(
          height: height,
          children: [
            pageTitle(title),
            Positioned(
              left: 14,
              top: 41,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.maybePop(context),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/arrow_left.svg',
                    width: 16,
                    height: 12,
                  ),
                ),
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Tombol biru besar 316x44 di dasar layar (top 730).
Widget bigButton(
  String label,
  VoidCallback onTap, {
  String? icon,
  double iw = 0,
  double ih = 0,
}) => Positioned(
  left: 22,
  top: 730,
  width: 316,
  height: 44,
  child: ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF3D6FE8),
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[ico(icon, iw, ih), const SizedBox(width: 12)],
        Text(label, style: ts(14, FontWeight.w600, Colors.white)),
      ],
    ),
  ),
);

/// Kolom isian 316x44 dengan ikon di kiri. Aktif (fokus) = garis biru + isi biru muda.
class PillField extends StatefulWidget {
  final double top;
  final Widget icon;
  final double iconLeft;
  final String? initial;
  final String? hint;
  final Color textColor;
  final double fontSize;
  final double textLeft;
  final bool highlighted;
  final double height;
  const PillField({
    super.key,
    required this.top,
    required this.icon,
    this.iconLeft = 18,
    this.initial,
    this.hint,
    this.textColor = Colors.black,
    this.fontSize = 14,
    this.textLeft = 54,
    this.highlighted = false,
    this.height = 44,
  });

  @override
  State<PillField> createState() => _PillFieldState();
}

class _PillFieldState extends State<PillField> {
  late final TextEditingController _c = TextEditingController(
    text: widget.initial,
  );
  final FocusNode _f = FocusNode();

  @override
  void initState() {
    super.initState();
    _f.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _c.dispose();
    _f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.highlighted || _f.hasFocus;
    return Positioned(
      left: 22,
      top: widget.top,
      width: 316,
      height: widget.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: active ? const Color(0xFFEEF1FD) : Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: active ? const Color(0xFF3D6FE8) : const Color(0xFFD5D5D5),
          ),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(left: widget.iconLeft, child: widget.icon),
            Padding(
              padding: EdgeInsets.only(left: widget.textLeft, right: 12),
              child: TextField(
                controller: _c,
                focusNode: _f,
                style: ts(widget.fontSize, FontWeight.w600, widget.textColor),
                decoration: InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isCollapsed: true,
                  hintText: widget.hint,
                  hintStyle: ts(
                    widget.fontSize,
                    FontWeight.w600,
                    const Color(0xFFC4C4C4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Sakelar 39x18.
class Toggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const Toggle({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => onChanged(!value),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 39,
      height: 18,
      padding: const EdgeInsets.all(2),
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      decoration: BoxDecoration(
        color: value ? const Color(0xFF3D6FE8) : const Color(0xFFD5D8E3),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Container(
        width: 14,
        height: 14,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    ),
  );
}
