import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double logoHeight;
  final double topspacing;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.logoHeight = 120,
    this.topspacing = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Image.asset('assets/images/logo.png', height: logoHeight),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.grey),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.placeholder)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'atau',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.placeholder),
          ),
        ),
        Expanded(child: Divider(color: AppColors.placeholder)),
      ],
    );
  }
}

class AuthFooter extends StatelessWidget {
  final String question;
  final String action;
  final VoidCallback onTap;

  const AuthFooter({
    super.key,
    required this.question,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$question ',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.grey),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            action,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}