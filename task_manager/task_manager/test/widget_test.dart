// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/start_screen.dart';
import 'package:task_manager/task_list.dart';
import 'package:task_manager/models/dummy_data.dart';

void main() {
  testWidgets('Verify the startscreen widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: StartScreen()));

    // verify the background image
    final backgroundImageFinder = find.byType(Image);
    expect(backgroundImageFinder, findsOneWidget);

    // verify the Get Started button
    final getStartedButtonFinder = find.byType(TextButton);
    expect(getStartedButtonFinder, findsOneWidget);

    // tap the get started button
    await tester.tap(getStartedButtonFinder);
    await tester.pumpAndSettle(); // Wait for navigation animation to complete

    // verify the task List widget

    expect(find.byType(TaskList), findsOneWidget);
  });
}
