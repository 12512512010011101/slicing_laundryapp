import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'home_screen.dart';
import 'riwayat_screen.dart';
import 'tagihan_screen.dart';
import 'profil_screen.dart';

/// Rangka utama: 4 tab + bottom nav.
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: IndexedStack(
        index: _tab,
        children: const [HomeScreen(), RiwayatScreen(), TagihanScreen(), ProfilScreen()],
      ),
      bottomNavigationBar: AppBottomNav(
        index: _tab,
        onTap: (i) => setState(() => _tab = i),
        // TODO: tombol (+) -> layar pilih produk / pesan
      ),
    );
  }
}
