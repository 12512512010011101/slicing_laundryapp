import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() => runApp(const MaslondreApp());

class MaslondreApp extends StatelessWidget {
  const MaslondreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maslondre',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Scaffold(body: Center(child: Text('Maslondre'))),
    );
  }
}