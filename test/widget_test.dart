import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dispositivos_moveis/main.dart';

void main() {
  testWidgets('exibe a tela inicial do jogo', (WidgetTester tester) async {
    await tester.pumpWidget(const FlagGameApp());

    expect(find.text('Escolha o modo de jogo:'), findsOneWidget);
    expect(find.text('Jogo Aleatório (Mundial)'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Tempo de jogo:'), findsOneWidget);
  });
}
