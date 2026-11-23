import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? prefix;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.prefix,
    this.obscure = false,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.grey,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: AppSpacing.controlHeight,
          child: TextField(
            controller: controller,
            obscureText: obscure,
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: prefix == null
                  ? null
                  : SizedBox(
                      width: 48,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: FittedBox(child: prefix),
                          ),
                        ),
                      ),
                    ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 48,
                maxWidth: 48,
                minHeight: 44,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
