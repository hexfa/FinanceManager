import 'package:finance_manager/presentation/view/widgets/dialog/custom_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays title and content text correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => CustomConfirmDialog(
                        title: 'Delete Item',
                        content: 'Are you sure?',
                        onConfirm: () {},
                      ),
                );
              },
              child: const Text('Show Dialog'),
            );
          },
        ),
      ),
    );
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();
    expect(find.text('Delete Item'), findsOneWidget);
    expect(find.text('Are you sure?'), findsOneWidget);
  });



  testWidgets('calls onConfirm when confirm button is pressed', (tester) async {

    bool confirmed = false;



    await tester.pumpWidget(

      MaterialApp(

        home: Builder(

          builder: (context) {

            return ElevatedButton(

              onPressed: () {

                showDialog(

                  context: context,

                  builder:

                      (_) => CustomConfirmDialog(

                        title: 'Confirm',

                        content: 'Sure?',

                        onConfirm: () {


                          confirmed = true;

                        },

                      ),

                );


              },

              child: const Text('Open'),

            );

          },

        ),

      ),


    );



    await tester.tap(find.text('Open'));

    await tester.pumpAndSettle();



    await tester.tap(find.text('OK'));

    await tester.pumpAndSettle();



    expect(confirmed, isTrue);

  });

}

