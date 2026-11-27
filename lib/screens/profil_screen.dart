import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/abs.dart';
import 'edit_profil_screen.dart';
import 'alamat_screen.dart';
import 'keamanan_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  static const _grey = Color(0xFF5F6368);
  static const _hint = Color(0xFFAAAAAA);

  Widget _circle(double left, double top, double size, double opacity) => Positioned(
        left: left,
        top: top,
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white.withOpacity(opacity), shape: BoxShape.circle),
        ),
      );

  Widget _stat(double left, String value, String label) => Positioned(
        left: left,
        top: 0,
        width: 109,
        height: 59,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: ts(20, FontWeight.w600, Colors.black)),
            Text(label, style: ts(11, FontWeight.w600, _grey, ls: 1.5)),
          ],
        ),
      );

  Widget _menu(BuildContext context, double top, Widget icon, String title, String sub, Widget Function()? page, {double textLeft = 61.3}) => Positioned(
        left: 22.5,
        top: top,
        width: 315,
        height: 55,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: page == null ? null : () => Navigator.push(context, MaterialPageRoute(builder: (_) => page())),
          child: Ink(
            decoration: cardBox(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 12.5,
                  top: 12.5,
                  width: 33,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: const Color(0xFFEEF1FD), borderRadius: BorderRadius.circular(8)),
                    child: Center(child: icon),
                  ),
                ),
                at(textLeft, 21.5, Text(title, style: ts(12, FontWeight.w600, Colors.black))),
                at(textLeft, 39, Text(sub, style: ts(11, FontWeight.w400, _hint))),
                at(282.5, 27.5, ico('chevron', 9, 16), h: 16),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AbsPage(
      height: 770,
      children: [
        // header biru
        Positioned(
          left: 0,
          top: 89,
          width: 360,
          height: 199,
          child: ClipRect(
            child: Container(
              color: AppColors.primary,
              child: Stack(children: [
                _circle(255, -83, 180, 0.15),
                _circle(-112, 128, 180, 0.12),
              ]),
            ),
          ),
        ),
        pageTitle('Profil'),
        Positioned(left: 141, top: 97, child: ico('avatar', 78, 78)),
        const Positioned(left: 0, right: 0, top: 183, child: Center(child: _HeaderText('Budi Santo', 20, FontWeight.w700))),
        const Positioned(left: 0, right: 0, top: 218, child: Center(child: _HeaderText('+62 853-0110-0011', 16, FontWeight.w600))),
        // kartu statistik
        Positioned(
          left: 15.5,
          top: 259.5,
          width: 328,
          height: 59,
          child: DecoratedBox(
            decoration: cardBox(radius: 10),
            child: Stack(children: [
              _stat(0, '24', 'Pesanan'),
              Positioned(left: 109.5, top: 0, bottom: 0, child: const VerticalDivider(width: 1, color: Color(0xFFEAEDF5))),
              _stat(110, '68 kg', 'Total Cucian'),
              Positioned(left: 219.5, top: 0, bottom: 0, child: const VerticalDivider(width: 1, color: Color(0xFFEAEDF5))),
              _stat(219, '24', 'Pesanan'),
            ]),
          ),
        ),
        at(25.4, 345, Text('Akun', style: ts(14, FontWeight.w600, _grey))),
        _menu(context, 359.5, ico('user', 22, 22), 'Edit Profil', 'Nama foto, nomor HP', () => const EditProfilScreen()),
        _menu(context, 425.5, ico('pin', 20, 23), 'Alamat Tersimpan', 'Jl. Merdeka No. 12', () => const AlamatScreen()),
        at(23, 506.5, Text('Preferensi', style: ts(14, FontWeight.w600, _grey))),
        _menu(context, 521.5, ico('bell_p', 19, 20), 'Notifikasi', 'Status pesanan, promo', null, textLeft: 59.3), // TODO: layar Notifikasi
        _menu(context, 587.5, ico('shield', 20, 24), 'Keamanan', 'PIN, sidik jari', () => const KeamananScreen()),
        Positioned(
          left: 0,
          right: 0,
          top: 712,
          child: InkWell(
            onTap: () {}, // TODO: logout -> LoginScreen
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ico('logout', 20, 20),
                const SizedBox(width: 5),
                Text('Keluar', style: ts(16, FontWeight.w600, const Color(0xFFE83D40))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  const _HeaderText(this.text, this.size, this.weight);
  @override
  Widget build(BuildContext context) => Text(text, style: ts(size, weight, Colors.white));
}
