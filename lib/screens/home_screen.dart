import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/app_icons.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const _services = [
    ('svc_shirt', 'Cuci Kiloan'),
    ('svc_iron', 'Setrika'),
    ('svc_cloud', 'Cuci Selimut'),
    ('svc_crown', 'Premium'),
  ];

  TextStyle _t(double s, FontWeight w, [Color c = Colors.black]) =>
      TextStyle(fontFamily: 'Poppins', fontSize: s, fontWeight: w, color: c);

  Widget _header() => Container(
        height: 110,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(22, 56, 22, 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MASLONDRE',
                      style: _t(18, FontWeight.w800, AppColors.primary)),
                  Text('Cucian bersih, hidup lebih ringan',
                      style: _t(11, FontWeight.w400, const Color(0xFF5F6368))),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                svgIcon('bell', size: 24),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            svgIcon('cube', size: 24),
          ],
        ),
      );

  Widget _banner() => ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: SizedBox(
          width: 316,
          height: 211,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/promo_banner.jpg', fit: BoxFit.cover),
              Positioned(
                left: 16,
                top: 16,
                child: Row(children: [
                  svgIcon('promo_gift', size: 20),
                  const SizedBox(width: 6),
                  Text('Promo spesial', style: _t(12, FontWeight.w600, Colors.white)),
                ]),
              ),
            ],
          ),
        ),
      );

  Widget _dots() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (i) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == 0 ? 16 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == 0 ? AppColors.primary : const Color(0xFFD0D5E2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      );

  Widget _serviceCard(String icon, String label) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color(0xFFE6E8F0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgIcon(icon, size: 32),
            const SizedBox(height: 8),
            Text(label, style: _t(12, FontWeight.w600)),
          ],
        ),
      );

  Widget _historyItem(String title, String sub) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(17)),
        child: Row(
          children: [
            svgIcon('hist_shirt', size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: _t(13, FontWeight.w600)),
                  Text(sub,
                      style: _t(11, FontWeight.w400, const Color(0xFF5F6368))),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F6EC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('Selesai',
                  style: _t(10, FontWeight.w600, const Color(0xFF1E9E55))),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _header(),
          const Divider(height: 1, color: Color(0xFFE6E8F0)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 24),
              children: [
                _banner(),
                const SizedBox(height: 10),
                _dots(),
                const SizedBox(height: 20),
                Text('Layanan', style: _t(16, FontWeight.w700)),
                const SizedBox(height: 12),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 152 / 96,
                  children: [for (final s in _services) _serviceCard(s.$1, s.$2)],
                ),
                const SizedBox(height: 20),
                Text('Riwayat', style: _t(16, FontWeight.w700)),
                const SizedBox(height: 12),
                _historyItem('Cuci Kiloan', 'Order #1024 · 3 kg'),
                _historyItem('Setrika', 'Order #1019 · 2 kg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}