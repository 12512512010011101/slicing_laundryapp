import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/app_icons.dart';
import 'abs.dart';

class AppBottomNav extends StatelessWidget {
  final int index; // 0 Beranda, 1 Riwayat, 2 Tagihan, 3 Profil
  final ValueChanged<int> onTap;
  final VoidCallback? onPlus;
  const AppBottomNav({super.key, required this.index, required this.onTap, this.onPlus});

  static const _items = [
    ('nav_home', 'Beranda', 47.0, 0),
    ('nav_history', 'Riwayat', 117.0, 1),
    ('nav_bill', 'Tagihan', 249.0, 2),
    ('nav_profile', 'Profil', 314.0, 3),
  ];
  static const _idle = Color(0xFFC0C5D6);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return SizedBox(
      height: 47 + bottom,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 360,
          height: 47,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, -2))],
                  ),
                ),
              ),
              for (final it in _items)
                Positioned(
                  left: it.$3 - 36,
                  width: 72,
                  top: 0,
                  height: 47,
                  child: InkWell(
                    onTap: () => onTap(it.$4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        svgIcon(it.$1, size: 24, color: index == it.$4 ? AppColors.primary : _idle),
                        Text(it.$2,
                            style: ts(10, FontWeight.w600, index == it.$4 ? AppColors.primary : _idle)),
                      ],
                    ),
                  ),
                ),
              Positioned(
                left: 182 - 25,
                top: -7,
                child: InkWell(
                  onTap: onPlus,
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 6, offset: Offset(0, 2))],
                    ),
                    child: Center(child: svgIcon('nav_plus', size: 24)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
