import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ayo_mulung/main.dart';

void main() {
  testWidgets('HomePage renders with title and categories', (
    WidgetTester tester,
  ) async {
    // Build the AyoMulungApp widget
    await tester.pumpWidget(AyoMulungApp());

    // Verify that the AppBar title appears
    expect(find.text('AYO MULUNG!'), findsOneWidget);

    // Verify that the welcome text appears
    expect(
      find.text('Selamat Datang Di Aplikasi Kebersihan Lingkungan!'),
      findsOneWidget,
    );

    // Verify that category titles appear
    expect(find.text('Organik'), findsOneWidget);
    expect(find.text('Anorganik'), findsOneWidget);
    expect(find.text('Daur Ulang'), findsOneWidget);
  });
}
