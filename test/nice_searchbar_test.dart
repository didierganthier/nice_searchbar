import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nice_searchbar/nice_searchbar.dart';

void main() {
  testWidgets('NiceSearchBar expands and collapses on tap', (
    WidgetTester tester,
  ) async {
    bool additionalFunctionCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NiceSearchBar(
            hint: "Search...",
            onChanged: (_) {},
            additionalFunction: () {
              additionalFunctionCalled = true;
            },
          ),
        ),
      ),
    );

    // Ensure the search bar starts in its folded state
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.close), findsNothing);

    // Wait for auto-expansion from initState
    await tester.pump(const Duration(milliseconds: 900));

    // Search bar should be unfolded now
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);

    // Tap on the close icon to collapse the search bar
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Verify that the search bar collapses
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.close), findsNothing);
    expect(additionalFunctionCalled, isTrue);
  });

  testWidgets('NiceSearchBar calls onChanged when typing', (
    WidgetTester tester,
  ) async {
    String typedText = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NiceSearchBar(
            hint: "Search...",
            onChanged: (value) {
              typedText = value;
            },
          ),
        ),
      ),
    );

    // Wait for auto-expansion from initState
    await tester.pump(const Duration(milliseconds: 900));

    // Ensure the search bar is expanded
    expect(find.byType(TextField), findsOneWidget);

    // Enter text into the search field
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.pump();

    expect(typedText, 'Hello');
  });
}
