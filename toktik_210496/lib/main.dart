import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_210496/config/theme/app_theme.dart';
import 'package:toktik_210496/presentation/providers/discover_provider.dart';
import 'package:toktik_210496/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadnextPage()),
      ],
      child: MaterialApp(
        title: 'TokTik_Carlos_Martin',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}