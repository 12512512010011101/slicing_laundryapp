import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'new_password_screen.dart';
import '../core/theme/app_colors.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/primary_button.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, this.phone = '+62 853-0110-0011'});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _nodes = List.generate(6, (_) => FocusNode());
  Timer? _timer;
  int _seconds = 55;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _seconds = 55);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_seconds <= 1) {
        t.cancel();
        setState(() => _seconds = 0);
      } else {
        setState(() => _seconds--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  Widget _box(int i) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: AppColors.primary),
    );
    final filled = _controllers[i].text.isNotEmpty;
    return SizedBox(
      width: 44,
      height: 60,
      child: TextField(
        controller: _controllers[i],
        focusNode: _nodes[i],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: filled ? const Color(0xFFEEF1FD) : Colors.white,
          contentPadding: EdgeInsets.zero,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
        onChanged: (v) {
          setState(() {});
          if (v.isNotEmpty && i < 5) _nodes[i + 1].requestFocus();
          if (v.isEmpty && i > 0) _nodes[i - 1].requestFocus();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.pageMargin),
                child: Column(
                  children: [
                    const AuthBackButton(),
                    const SizedBox(height: 96),
                    SvgPicture.asset('assets/icons/phone_chat.svg',
                        width: 49, height: 56),
                    const SizedBox(height: 15),
                    const Text(
                      'Cek HP anda!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 3),
                    Text.rich(
                      TextSpan(
                        text: 'OTP yang dikirim ke ',
                        children: [
                          TextSpan(
                            text: widget.phone,
                            style: const TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                    const SizedBox(height: 37),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, _box),
                    ),
                    const SizedBox(height: 33),
                    PrimaryButton(
                      label: 'Verifikasi',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NewPasswordScreen()),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tidak dapat kode? ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0x73000000)),
                        ),
                        InkWell(
                          onTap: _seconds == 0 ? _startTimer : null,
                          child: Text(
                            _seconds == 0
                                ? 'Kirim ulang'
                                : 'Kirim ulang (${_seconds}s)',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 37),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}