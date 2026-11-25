import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'account_created_screen.dart';
import '../core/app_icons.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/primary_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSpacing.pageMargin),
          child: Column(
            children: [
              const AuthBackButton(),
              const SizedBox(height: 89),
              SvgPicture.asset('assets/icons/lock_check_big.svg',
                  width: 49, height: 56),
              const SizedBox(height: 15),
              const Text(
                'Atur password baru',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(height: 9),
              const Text(
                'Pastikan anda mengingatnya\nkembali,',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    color: Color(0x73000000)),
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Password',
                hint: 'Masukkan password',
                obscure: true,
                prefix: svgIcon('lock', color: AppColors.placeholder),
              ),
              const SizedBox(height: 10),
              AppTextField(
                label: 'Konfirmasi password',
                hint: 'Konfirmasi password',
                obscure: true,
                prefix: svgIcon('lock_tick', color: AppColors.placeholder),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Reset password',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AccountCreatedScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}