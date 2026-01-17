import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/build_testable_widget.dart';


void main() {

  testWidgets('verify more_vert icon is displayed in CustomAppBarMenu', (

    tester,

  ) async {

    await tester.pumpWidget(

      buildTestableWidget(CustomAppBarMenu(menuItem: [])),

    );


    expect(find.byIcon(Icons.more_vert), findsOneWidget);

  });



  testWidgets('Verify menu items appear when clicking on menu icon', (

    tester,

      ) async {

    final menuItems = [

      AppBarMenu(title: 'Item 1', icon: Icons.edit, onTap: () {}),

      AppBarMenu(title: 'Item 2', icon: Icons.delete, onTap: () {}),

    ];


    await tester.pumpWidget(

      buildTestableWidget(CustomAppBarMenu(menuItem: menuItems)),

    );




    await tester.tap(find.byIcon(Icons.more_vert));

    await tester.pumpAndSettle();



    expect(find.text('Item 1'), findsOneWidget);

    expect(find.text('Item 2'), findsOneWidget);

  });


  testWidgets('ensure onTap is triggered when menu item is selected', (

    tester,

      ) async {

    bool tapped = false;



    final menuItems = [

      AppBarMenu(

        title: 'Do Action',

        icon: Icons.done,

        onTap: () {

          tapped = true;

        },

      ),

    ];



    await tester.pumpWidget(

      buildTestableWidget(CustomAppBarMenu(menuItem: menuItems)),

    );


    await tester.tap(find.byIcon(Icons.more_vert));

    await tester.pumpAndSettle();



    await tester.tap(find.text('Do Action'));

    await tester.pump();



    expect(tapped, isTrue);

  });

}
