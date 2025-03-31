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

    // Check that the search icon is initially visible
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.close), findsNothing);

    // Tap on the search icon to expand the app bar
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    // Check that the app bar expanded and the close icon is visible
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);
    expect(additionalFunctionCalled, isTrue);

    // Tap on the close icon to collapse the app bar
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Check that the app bar collapsed back
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.close), findsNothing);
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

    // Expand the search bar
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    // Enter text into the search field
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.pump();

    expect(typedText, 'Hello');
  });
}
