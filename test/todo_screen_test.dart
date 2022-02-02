import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workshop_task/screen/todo_screen.dart';

Widget createHomeScreen() => const MaterialApp(
      home: TodoScreen(),
    );

// Future<void> generateListTodo(var tester) async {
//   for (int i = 1; i < 10; i++) {
//     await tester.tap(find.byIcon(Icons.add).first);
//     await tester.pumpAndSettle();
//     //textfields = tester.widgetList(find.byType(TextField));
//     // expect(textfields[0].decoration.errorText, isNotNull);
//     // expect(textfields[1].decoration.errorText, isNotNull);

//     await tester.enterText(find.byType(TextField).first, 'a');
//     await tester.pumpAndSettle();

//     await tester.enterText(find.byType(TextField).at(1), 'b');
//     await tester.pumpAndSettle();

//     await tester.tap(find.byType(TextButton).first);
//     await tester.pumpAndSettle();
//   }
// }

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing Add Button', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byType(Dialog)).length, 1);
      var textfields = tester.widgetList(find.byType(TextField));
      expect(textfields.length, 2);
      expect(tester.widgetList(find.byType(TextButton)).length, 1);

      await tester.tap(find.byType(TextButton).first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 't');
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(1), 'd');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(TextButton).first);
      await tester.pumpAndSettle();

      expect(tester.widgetList(find.textContaining('t')).isNotEmpty, true);
      expect(tester.widgetList(find.textContaining('d')).isNotEmpty, true);

      expect(tester.widgetList(find.byType(ListView)).isNotEmpty, true);

      await tester.tap(find.textContaining('t'));
      await tester.pump(kDoubleTapMinTime); // <- Add this
      await tester.tap(find.textContaining('t'));
      await tester.pumpAndSettle();

      expect(tester.widgetList(find.byType(Dialog)).isNotEmpty, true);
      expect(tester.widgetList(find.byType(TextButton)).length, 2);
      await tester.tap(find.textContaining('No'));
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('t'));
      await tester.pump(kDoubleTapMinTime); // <- Add this
      await tester.tap(find.textContaining('t'));
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('Yes'));
      await tester.pumpAndSettle();

      expect(tester.widgetList(find.textContaining('t')).isEmpty, true);
    });
  });
}
