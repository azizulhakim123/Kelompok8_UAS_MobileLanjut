import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'history_page.dart';
import 'conversion_page.dart';
import 'finance_calculator_page.dart';
import 'math_functions_page.dart';  // Pastikan Anda mengimpor halaman Fungsi Matematika

void main() => runApp(HitungCepatApp());

class HitungCepatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HitungCepat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      home: HalamanKalkulator(),
      routes: {
        '/history': (context) => HistoryPage(),
        '/conversion': (context) => HalamanKonversi(),
        '/finance': (context) => HalamanKalkulatorKeuangan(),
        '/mathFunction': (context) => MathFunctionsPage(),  // Menambahkan rute fungsi matematika
      },
    );
  }
}
