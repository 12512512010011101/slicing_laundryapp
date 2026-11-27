import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/abs.dart';
import 'alamat_form_screen.dart';

class AlamatScreen extends StatefulWidget {
  const AlamatScreen({super.key});
  @override
  State<AlamatScreen> createState() => _AlamatScreenState();
}

class _AlamatScreenState extends State<AlamatScreen> {
  int _selected = 0;

  static const _grey = Color(0xFF5F6368);
  static const _hint = Color(0xFFAAAAAA);

  static const _saved = [
    ('house', 22.0, 22.0, 'Rumah', 'Jl. Merdeka No.12, Kediri'),
    ('office', 20.0, 19.0, 'Kantor', 'Jl. Sudirman No.45, Kediri'),
    ('kos', 20.0, 19.5, 'Kos', 'Jl. Kenanga No.8, Kediri'),
  ];
  static const _near = [
    ('Jl. Ahmad Yani No. 10', '0.3 km'),
    ('Jl. Hayam wuruk No. 3', '0.7 km'),
    ('Jl. Merdeka No. 22', '1.2 km'),
  ];

  Widget _tile(Widget icon) => Positioned(
        left: 17.5,
        top: 11.5,
        width: 32,
        height: 31,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: const Color(0xFFEEF1FD), borderRadius: BorderRadius.circular(8)),
          child: Center(child: icon),
        ),
      );

  Widget _item(double top, Widget icon, String title, String sub, Widget right,
      {VoidCallback? onTap}) {
    return Positioned(
      left: 22.5,
      top: top,
      width: 315,
      height: 55,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: Ink(
          decoration: cardBox(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _tile(icon),
              at(73.3, 20, Text(title, style: ts(12, FontWeight.w600, Colors.black))),
              at(73.3, 40.5, Text(sub, style: ts(12, FontWeight.w600, _hint))),
              right,
            ],
          ),
        ),
      ),
    );
  }

  void _open(bool edit) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => AlamatFormScreen(edit: edit)));

  @override
  Widget build(BuildContext context) {
    return SubPage(
      title: 'Alamat',
      children: [
        // kolom cari
        Positioned(
          left: 24.5,
          top: 105.5,
          width: 311,
          height: 35,
          child: DecoratedBox(
            decoration: cardBox(),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(left: 15.5, child: ico('search', 14, 14)),
                Padding(
                  padding: const EdgeInsets.only(left: 38, right: 12),
                  child: TextField(
                    style: ts(14, FontWeight.w600, Colors.black),
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
                      hintText: 'Cari atau tentukan lokasi',
                      hintStyle: ts(14, FontWeight.w600, _hint),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // tambah alamat baru
        Positioned(
          left: 22.5,
          top: 167.5,
          width: 315,
          height: 57,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            hoverColor: Colors.transparent,
            onTap: () => _open(false),
            child: Ink(
              decoration: cardBox(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 14.5,
                    top: 9.5,
                    width: 38,
                    height: 37,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                      child: Center(child: ico('plus_big', 24, 23)),
                    ),
                  ),
                  at(63.9, 23.4,
                      Text('Tambah alamat baru', style: ts(14, FontWeight.w600, AppColors.primary))),
                  at(65.3, 39.8,
                      Text('Ketuk untuk menambah lokasi', style: ts(12, FontWeight.w600, _hint))),
                ],
              ),
            ),
          ),
        ),
        at(22, 252.4, Text('Alamat tersimpan', style: ts(14, FontWeight.w600, _grey))),
        for (var i = 0; i < _saved.length; i++)
          _item(
            265.5 + i * 68,
            ico(_saved[i].$1, _saved[i].$2, _saved[i].$3),
            _saved[i].$4,
            _saved[i].$5,
            i == _selected
                ? Positioned(left: 270.5, top: 14.5, child: ico('check_badge', 27, 25))
                : Positioned(
                    left: 249,
                    top: 0,
                    bottom: 0,
                    width: 70,
                    child: Center(
                      child: InkWell(
                        onTap: () => _open(true),
                        child: Text('Edit', style: ts(11, FontWeight.w700, AppColors.primary)),
                      ),
                    ),
                  ),
            onTap: () => setState(() => _selected = i),
          ),
        at(22, 484, Text('Lokasi', style: ts(14, FontWeight.w600, _grey))),
        for (var i = 0; i < _near.length; i++)
          _item(
            497.5 + i * 68,
            ico('pin_b', 19.5, 22),
            _near[i].$1,
            'Kediri, Jawa Timur',
            Positioned(
              left: 239,
              top: 0,
              bottom: 0,
              width: 84,
              child: Center(
                  child: Text(_near[i].$2, style: ts(12, FontWeight.w600, AppColors.primary))),
            ),
            onTap: () => _open(false),
          ),
        bigButton('Lacak Pesanan', () {}), // TODO: layar Lacak Pesanan
      ],
    );
  }
}