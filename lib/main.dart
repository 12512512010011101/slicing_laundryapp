import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() => runApp(const MaslondreApp());

class MaslondreApp extends StatelessWidget {
  const MaslondreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maslondre',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginScreen(),
    );
  }
}