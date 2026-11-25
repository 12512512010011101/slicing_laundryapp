import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'otp_screen.dart';
import '../core/app_icons.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              const SizedBox(height: 130),
              SvgPicture.asset('assets/icons/mail_big.svg',
                  width: 49, height: 34),
              const SizedBox(height: 11),
              const Text(
                'Lupa password?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(height: 3),
              const SizedBox(
                width: 232,
                child: Text(
                  'Jangan khawatir, kami akan memberikan intruksi reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: Color(0x73000000)),
                ),
              ),
              const SizedBox(height: 18),
              AppTextField(
                label: 'Email',
                hint: 'Masukkan email',
                keyboardType: TextInputType.emailAddress,
                prefix: svgIcon('sms', color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Reset password',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OtpScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}