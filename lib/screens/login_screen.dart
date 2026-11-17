import 'package:flutter/material.dart';
import '../core/app_icons.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.pageMargin),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Image.asset('assets/images/logo.png', height: 120),
                      const SizedBox(height: 8),
                      const Text(
                        'Selamat datang!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Masukkan akunmu untuk melanjutkan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey),
                      ),
                      const SizedBox(height: 24),
                      AppTextField(
                        label: 'Email',
                        hint: 'budisanto@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        prefix: svgIcon('sms', color: AppColors.primary),
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        label: 'Password',
                        hint: 'Masukkan password',
                        obscure: true,
                        prefix: svgIcon('lock', color: AppColors.placeholder),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {}, // TODO: ke layar lupa password
                          child: const Text(
                            'Lupa password?',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PrimaryButton(label: 'Masuk', onPressed: () {}),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(color: AppColors.placeholder)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'atau',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.placeholder),
                            ),
                          ),
                          const Expanded(
                              child: Divider(color: AppColors.placeholder)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      PrimaryButton(
                        label: 'Masuk dengan google',
                        outlined: true,
                        icon: svgIcon('google', size: 18),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum punya akun? ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey),
                          ),
                          InkWell(
                            onTap: () {}, // TODO: ke layar register
                            child: const Text(
                              'Daftar dulu',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}