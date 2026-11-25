import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';
import '../core/theme/app_colors.dart';
import '../widgets/primary_button.dart';

class _OnboardData {
  final String title;
  final String subtitle;
  final String image;
  const _OnboardData(this.title, this.subtitle, this.image);
}

const _pages = [
  _OnboardData(
    'Laundry tanpa ribet',
    'Pesan layanan laundry kapan saja,\nkami jemput dan antar kembali ke\npintu rumahmu.',
    'assets/images/onboarding_1.svg',
  ),
  _OnboardData(
    'Pantau cucianmu kapan saja',
    'Lihat status cucian secara real-time\ndari dijemput , dicuci, hingga diantar\nkembali ke rumahmu.',
    'assets/images/onboarding_2.svg',
  ),
  _OnboardData(
    'Bersih, rapi, dan wangi',
    'Dikerjakan oleh mitra laundry terpilih\ndengan standar kebersihan terbaik\ndan terjamin',
    'assets/images/onboarding_3.svg',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_index < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => _OnboardPage(data: _pages[i]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(left: i == 0 ? 0 : 11),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _index
                          ? AppColors.primary
                          : AppColors.placeholder,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 96),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageMargin,
              ),
              child: PrimaryButton(label: 'Lanjut', onPressed: _next),
            ),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  final _OnboardData data;
  const _OnboardPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final top = c.maxHeight >= 600 ? 160.0 : 60.0;
        return Column(
          children: [
            SizedBox(height: top),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              data.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height: 1.3,
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 44),
            Expanded(
              child: SvgPicture.asset(
                data.image,
                width: double.infinity,
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      },
    );
  }
}
