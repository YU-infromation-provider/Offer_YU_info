import 'package:flutter/material.dart';
import 'package:haksikgo/pages/home_page.dart';
import 'package:haksikgo/pages/login_page.dart';
import 'package:haksikgo/pages/register_page.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF376860),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF376860),
          selectionColor: Color(0xFF376860),
          selectionHandleColor: Color(0xFF376860),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF376860)),
          ),
          labelStyle: TextStyle(
            color: Colors.black, // 여기에서 색상을 원하는 색상으로 변경하세요.
          ),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF376860)),
      ),
      initialRoute: '/Home_Page', // 초기 화면 설정
      routes: {
        '/Home_Page': (context) => const HomePage(), // Home 페이지
        '/login': (context) => const LoginApp(),
        '/register': (context) => const RegisterApp(), // LoginPage로 이동
      },
    );
  }
}
