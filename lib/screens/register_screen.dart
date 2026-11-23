import 'package:flutter/material.dart';
import '../core/app_icons.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.pageMargin,
                  ),
                  child: Column(
                    children: [
                      const AuthHeader(
                        title: 'Buat akun baru',
                        subtitle: 'Daftar gratis dan mulai pesan laundry',
                      ),
                      AppTextField(
                        label: 'Email',
                        hint: 'budisanto@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        prefix: svgIcon('sms', color: AppColors.primary),
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        label: 'Nomor HP',
                        hint: '+62 853-0110-0011',
                        keyboardType: TextInputType.phone,
                        prefix: svgIcon('call', color: AppColors.placeholder),
                      ),
                      const SizedBox(height: 10),
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
                        prefix: svgIcon('lock', color: AppColors.placeholder),
                      ),
                      const SizedBox(height: 12),
                      PrimaryButton(label: 'Daftar sekarang', onPressed: () {}),
                      const SizedBox(height: 2),
                      const OrDivider(),
                      const SizedBox(height: 6),
                      PrimaryButton(
                        label: 'Daftar dengan google',
                        outlined: true,
                        icon: svgIcon('google', size: 18),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      AuthFooter(
                        question: 'Sudah punya akun?',
                        action: 'Masuk',
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(height: 37),
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
