import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/abs.dart';

class _Order {
  final String id, title, kg, date, service, price, status;
  const _Order(this.id, this.title, this.kg, this.date, this.service, this.price, this.status);
}

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});
  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  int _tab = 0; // TODO: filter daftar sesuai tab

  static const _grey = Color(0xFF5F6368);
  static const _tabs = [
    ('Semua', 56.0, 67.0),
    ('Aktif', 141.0, 68.0),
    ('Selesai', 224.0, 84.0),
    ('Batal', 313.0, 72.0),
  ];

  static const _agustus = [
    _Order('#142', 'Cuci & setrika', '5kg', '26 Agu 2026', 'Regular', 'Rp 30.000', 'Diproses'),
    _Order('#138', 'Cuci kering', '2kg', '23 Agu 2026', 'Express', 'Rp 30.000', 'Diproses'),
    _Order('#142', 'Setrika saja', '2kg', '20 Agu 2026', 'Regular', 'Rp 8.000', 'Selesai'),
  ];
  static const _juli = [
    _Order('#124', 'Cuci & setrika', '2kg', '20 Agu 2026', 'Regular', 'Rp 8.000', 'Dibatalkan'),
  ];

  Widget _badge(String status) {
    if (status == 'Dibatalkan') {
      return Positioned(
        left: 209,
        top: 28,
        width: 84,
        height: 23,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0x66E83D40),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text(status, style: ts(12, FontWeight.w600, const Color(0xFFE83D40)))),
        ),
      );
    }
    return Positioned(
      left: 218.5,
      top: 28.5,
      width: 75,
      height: 22,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: const Color(0xFFE7E1E1)),
        ),
        child: Center(child: Text(status, style: ts(12, FontWeight.w600, AppColors.primary))),
      ),
    );
  }

  Widget _card(double top, _Order o) {
    final info = ts(12, FontWeight.w600, _grey);
    return Positioned(
      left: 22,
      top: top,
      width: 316,
      height: 123,
      child: DecoratedBox(
        decoration: cardBox(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            at(20, 18.5, Text(o.id, style: ts(12, FontWeight.w600, Colors.black))),
            at(20, 46.4, Text(o.title, style: ts(12, FontWeight.w600, Colors.black))),
            _badge(o.status),
            at(19, 72, ico('bag_s', 12, 12)),
            at(36.7, 75, Text(o.kg, style: info)),
            at(91, 72, ico('cal_s', 12, 12)),
            at(107.8, 75, Text(o.date, style: info)),
            at(220, 72, ico('clock_s', 13, 13)),
            at(238.3, 75, Text(o.service, style: info)),
            const Positioned(
              left: 0,
              right: 0,
              top: 90,
              child: Divider(height: 1, thickness: 1, color: Color(0xFFEAEDF5)),
            ),
            at(20.7, 108, Text(o.price, style: ts(12, FontWeight.w600, AppColors.primary))),
            at(241, 105.3, Text('Detail', style: ts(12, FontWeight.w600, AppColors.primary))),
            at(280, 104, ico('arrow_r', 12, 10)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsPage(
      height: 770,
      children: [
        pageTitle('Riwayat pesanan'),
        // tab filter
        for (var i = 0; i < _tabs.length; i++) ...[
          if (i == _tab)
            Positioned(
              left: _tabs[i].$2 - _tabs[i].$3 / 2,
              top: 103.5,
              width: _tabs[i].$3,
              height: 21,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(11)),
              ),
            ),
          Positioned(
            left: _tabs[i].$2 - _tabs[i].$3 / 2,
            top: 103.5,
            width: _tabs[i].$3,
            height: 21,
            child: InkWell(
              borderRadius: BorderRadius.circular(11),
              onTap: () => setState(() => _tab = i),
              child: Center(
                child: Text(_tabs[i].$1,
                    style: ts(14, FontWeight.w600, i == _tab ? Colors.white : const Color(0x80000000))),
              ),
            ),
          ),
        ],
        at(22.4, 153, Text('Agustus 2026', style: ts(14, FontWeight.w600, _grey))),
        for (var i = 0; i < _agustus.length; i++) _card(171.0 + i * 132, _agustus[i]),
        at(22.4, 584, Text('Juli 2026', style: ts(14, FontWeight.w600, _grey))),
        _card(604, _juli[0]),
      ],
    );
  }
}
