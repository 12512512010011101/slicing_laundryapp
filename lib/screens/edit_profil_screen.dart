import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/abs.dart';

class EditProfilScreen extends StatelessWidget {
  const EditProfilScreen({super.key});

  static const _grey = Color(0xFF5F6368);
  static const _soft = Color(0xFFAAAAAA);

  Widget _label(double cy, String t) =>
      at(22, cy, Text(t, style: ts(14, FontWeight.w600, Colors.black)));

  @override
  Widget build(BuildContext context) {
    return SubPage(
      title: 'Edit profil',
      children: [
        Positioned(left: 141, top: 111, child: ico('avatar', 78, 78)),
        Positioned(left: 196, top: 118, child: ico('cam', 21, 17)),
        Positioned(
          left: 0,
          right: 0,
          top: 213,
          child: Center(
            child: InkWell(
              onTap: () {}, // TODO: ganti foto
              child: Text('Ganti foto profil', style: ts(14, FontWeight.w600, AppColors.primary)),
            ),
          ),
        ),
        at(22, 260.5, Text('Informasi Pribadi', style: ts(14, FontWeight.w600, _grey))),
        _label(292.7, 'Nama lengkap'),
        PillField(
          top: 305.5,
          icon: ico('f_user', 17, 19.6),
          iconLeft: 22.5,
          initial: 'Budi Santo',
          highlighted: true,
        ),
        _label(372, 'Nomor HP'),
        PillField(
          top: 386.5,
          icon: ico('f_phone', 19.5, 20),
          iconLeft: 21,
          initial: '+62 853-0110-0011',
          textColor: _soft,
        ),
        _label(451.5, 'Email'),
        PillField(
          top: 467.5,
          icon: ico('f_mail', 23, 16.5),
          iconLeft: 19.5,
          initial: 'budisanto@gmail.com',
          textColor: _soft,
        ),
        _label(535.4, 'Tanggal lahir'),
        PillField(
          top: 548.5,
          icon: ico('f_cal', 18, 20),
          iconLeft: 22,
          hint: 'Tambah tanggal lahir',
        ),
        bigButton('Simpan', () => Navigator.maybePop(context)),
      ],
    );
  }
}
