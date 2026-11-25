import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../core/app_icons.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/primary_button.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                        title: 'Selamat datang!',
                        subtitle: 'Masukkan akunmu untuk melanjutkan',
                        subtitleWidth: 316,
                      ),
                      const SizedBox(height: 24),
                      AppTextField(
                        label: 'Email',
                        hint: 'budisanto@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        prefix: svgIcon('sms', color: AppColors.primary),
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        label: 'Password',
                        hint: 'Masukkan password',
                        obscure: true,
                        prefix: svgIcon('lock', color: AppColors.placeholder),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen(),
                            ),
                          ),
                          child: const Text(
                            'Lupa password?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PrimaryButton(label: 'Masuk', onPressed: () {}),
                      const SizedBox(height: 2),
                      const OrDivider(),
                      const SizedBox(height: 6),
                      PrimaryButton(
                        label: 'Masuk dengan google',
                        outlined: true,
                        icon: svgIcon('google', size: 18),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      AuthFooter(
                        question: 'Belum punya akun?',
                        action: 'Daftar dulu',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        ),
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
