import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/app_colors.dart';
import '../widgets/abs.dart';

/// Tambah alamat (edit: false) / Edit alamat (edit: true).
class AlamatFormScreen extends StatefulWidget {
  final bool edit;
  const AlamatFormScreen({super.key, this.edit = false});
  @override
  State<AlamatFormScreen> createState() => _AlamatFormScreenState();
}

class _AlamatFormScreenState extends State<AlamatFormScreen> {
  int _type = 0; // 0 Rumah, 1 Kos, 2 Kantor

  static const _grey = Color(0xFF5F6368);
  static const _types = [
    ('Rumah', 'house_sm', 19.0, 17.0, 22.5, 39.6),
    ('Kos', 'kos_sm', 16.0, 16.0, 129.5, 146.7),
    ('Kantor', 'office_sm', 17.0, 16.0, 236.5, 256.7),
  ];

  Widget _chip(int i) {
    final t = _types[i];
    final on = i == _type;
    final color = on ? AppColors.primary : const Color(0xFFAAAAAA);
    return Positioned(
      left: t.$5,
      top: 578.5,
      width: 101,
      height: 26,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: () => setState(() => _type = i),
        child: Ink(
          decoration: BoxDecoration(
            color: on ? const Color(0xFFEEF1FD) : Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: on ? AppColors.primary : const Color(0xFFD5D5D5)),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: t.$6 - t.$5 - 0.5,
                child: SvgPicture.asset(
                  'assets/icons/${t.$2}.svg',
                  width: t.$3,
                  height: t.$4,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
              Positioned(
                left: (i == 0 ? 61.8 : i == 1 ? 175.8 : 285.8) - t.$5 - 0.5,
                child: Text(t.$1, style: ts(12, FontWeight.w600, on ? Colors.black : color)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final edit = widget.edit;
    final street = edit ? 'Jl. Sudirman No. 45, Kediri' : 'Jl. Ahmad Yani No. 10';
    return SubPage(
      title: edit ? 'Edit alamat' : 'Tambah alamat',
      children: [
        at(22, 118.4, Text(edit ? 'Alamat tersimpan' : 'Pilih lokasi di peta', style: ts(14, FontWeight.w600, _grey))),
        // peta
        Positioned(
          left: 22,
          top: 131,
          width: 316,
          height: 160,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/icons/${edit ? 'map_edit' : 'map_add'}.svg',
                  width: 316,
                  height: 160,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 54,
                  top: 123,
                  height: 27,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Center(
                        child: Text(
                          edit ? street : 'Geser peta untuk memilih lokasi',
                          style: ts(12, FontWeight.w600, const Color(0xFF111827)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        at(22, 317.2, Text('Nama jalan/lokasi', style: ts(14, FontWeight.w600, _grey))),
        PillField(
          top: 331.5,
          icon: ico('target', 18.5, 18),
          iconLeft: 13.5,
          initial: street,
          fontSize: 12,
          textLeft: 45,
          highlighted: true,
          height: 43,
        ),
        at(22, 406, Text('Detail (RT/RW, Blok, No. Apartemen)', style: ts(14, FontWeight.w600, _grey))),
        PillField(
          top: 420,
          icon: ico('exclaim', 20, 22),
          iconLeft: 13,
          initial: edit ? 'Lantai 2, Ruang 201' : null,
          hint: 'Contoh: RT 03/RW 05, Blok A',
          fontSize: 12,
          textLeft: 47,
          height: 44,
        ),
        at(22, 495, Text('Catatan untuk kurir', style: ts(14, FontWeight.w600, _grey))),
        PillField(
          top: 509,
          icon: ico('note', 20.5, 20),
          iconLeft: 13,
          initial: edit ? 'Masuk dari pintu samping kanan' : null,
          hint: 'Contoh: pagar biru, depan toko',
          fontSize: 12,
          textLeft: 47,
          height: 44,
        ),
        for (var i = 0; i < 3; i++) _chip(i),
        bigButton(
          edit ? 'Simpan perubahan' : 'Gunakan alamat ini',
          () => Navigator.maybePop(context),
          icon: 'pin_w',
          iw: 15.5,
          ih: 18,
        ),
      ],
    );
  }
}
