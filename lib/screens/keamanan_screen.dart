import 'package:flutter/material.dart';
import '../widgets/abs.dart';

class KeamananScreen extends StatefulWidget {
  const KeamananScreen({super.key});
  @override
  State<KeamananScreen> createState() => _KeamananScreenState();
}

class _KeamananScreenState extends State<KeamananScreen> {
  bool _fingerprint = true;
  bool _face = true;
  bool _twoStep = true;

  static const _grey = Color(0xFF5F6368);
  static const _hint = Color(0xFFAAAAAA);

  Widget _row(
    double top,
    Widget icon,
    double iw,
    double ih,
    String title,
    String sub, {
    bool? toggle,
    ValueChanged<bool>? onToggle,
    VoidCallback? onTap,
  }) {
    return Positioned(
      left: 22.5,
      top: top,
      width: 315,
      height: 43,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: toggle == null ? (onTap ?? () {}) : null,
        child: Ink(
          decoration: cardBox(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 24 - iw / 2,
                top: 21.5 - ih / 2,
                child: Transform.scale(scale: 1.25, child: icon),
              ),
              at(
                52,
                17.4,
                Text(title, style: ts(12, FontWeight.w600, Colors.black)),
              ),
              at(52, 33, Text(sub, style: ts(10, FontWeight.w600, _hint))),
              if (toggle != null)
                Positioned(
                  left: 258.5,
                  top: 12.5,
                  child: Toggle(value: toggle, onChanged: onToggle!),
                )
              else
                at(282.5, 21.5, ico('chevron', 9, 16), h: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SubPage(
      title: 'Keamanan',
      children: [
        at(
          22,
          126.5,
          Text('Informasi Pribadi', style: ts(14, FontWeight.w600, _grey)),
        ),
        _row(
          141.5,
          ico('fingerprint', 18.5, 21.5),
          18.5,
          21.5,
          'Sidik jari',
          'Login pakai fingerprint',
          toggle: _fingerprint,
          onToggle: (v) => setState(() => _fingerprint = v),
        ),
        _row(
          203.5,
          ico('faceid', 19.5, 21.5),
          19.5,
          21.5,
          'Pengenalan wajah',
          'Login pakai fingerprint',
          toggle: _face,
          onToggle: (v) => setState(() => _face = v),
        ),
        at(22, 285, Text('Password', style: ts(14, FontWeight.w600, _grey))),
        _row(
          300.5,
          ico('lock_b', 17, 18),
          17,
          18,
          'Ganti password',
          'Terakhir diubah 3 bulan lalu',
        ),
        _row(
          362.5,
          ico('phone_dev', 18.5, 21.5),
          18.5,
          21.5,
          'Ganti nomor HP',
          '+62 853-0110-0011',
        ),
        at(22, 447, Text('Aktivitas', style: ts(14, FontWeight.w600, _grey))),
        _row(
          462.5,
          ico('phone_dev', 18.5, 21.5),
          18.5,
          21.5,
          'Perangkat yang login',
          '2 perangkat aktif',
        ),
        _row(
          524.5,
          ico('shield_chk', 15.5, 15.8),
          15.5,
          15.8,
          'Verifikasi dua langkah',
          'Kode OTP saat masuk',
          toggle: _twoStep,
          onToggle: (v) => setState(() => _twoStep = v),
        ),
        _row(
          586.5,
          ico('clock', 16, 16),
          16,
          16,
          'Riwayat login',
          'Terakhir masuk hari ini, 09.12',
        ),
        bigButton('Simpan', () => Navigator.maybePop(context)),
      ],
    );
  }
}
