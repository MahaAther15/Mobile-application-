import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_ordering/main.dart';

void main() {
  testWidgets('Pizza ordering flow test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SMTApp());

    // Verify that the app bar title is present.
    expect(find.text('SMT Cuisine'), findsOneWidget);

    // Verify that the order screen title is present.
    expect(find.text('🍕 Place Your Order'), findsOneWidget);

    // Enter a customer name.
    await tester.enterText(find.byType(TextField).first, 'John Doe');
    await tester.pump();

    // Verify discount code validation (no spaces).
    await tester.enterText(find.byType(TextFormField), 'DISCOUNT CODE');
    await tester.pump();
    expect(find.text("Don't use blank spaces"), findsOneWidget);

    // Fix discount code.
    await tester.enterText(find.byType(TextFormField), 'DISCOUNT');
    await tester.pump();
    expect(find.text("Don't use blank spaces"), findsNothing);

    // Verify dropdown default value.
    expect(find.text('Medium'), findsOneWidget);

    // Tap the submit button.
    await tester.tap(find.text('Submit Order'));
    await tester.pumpAndSettle();

    // Verify we are on the confirmation screen.
    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Medium'), findsOneWidget);

    // Confirm the order.
    await tester.tap(find.text('Confirm Order'));
    await tester.pumpAndSettle();

    // Verify the snackbar.
    expect(find.text('✅ Order Confirmed Successfully!'), findsOneWidget);
  });
}
