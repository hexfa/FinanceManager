import 'package:finance_manager/presentation/bloc/category/category_cubit.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:finance_manager/presentation/view/widgets/textfield/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});
  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends BaseState<CreateCategoryScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    // nameController.addListener(() {
    //   getBloc<TransactionCubit>().updateTitle(titleController.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: localization.createCategory),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            CustomTextField(

              prefixIcon: Icons.category_outlined,

              hint: '${localization.name} ...',

              controller: nameController,

            ),

            CustomButton(

              text: localization.create,

              onPressed: () async {

                final name = nameController.text.trim();

                if (name.isNotEmpty) {

                  await getBloc<CategoryCubit>().create(name);

                  navigator.pop();

                }

              },

            ),

          ],

        ),

      ),

    );

  }

}
