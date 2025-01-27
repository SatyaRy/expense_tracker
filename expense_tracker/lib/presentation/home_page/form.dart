import 'package:expense_tracker/provider/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormInput extends StatelessWidget {
  const FormInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        appBar: appBar(context),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Title(title: "Amount", icon: Icon(Icons.add_circle_outline)),
              AmountField(),
              SizedBox(
                height: 15,
              ),
              Title(title: "Category", icon: Icon(Icons.category_outlined)),
              SelectedCategory(),
              SizedBox(
                height: 15,
              ),
              Title(title: "Date", icon: Icon(Icons.date_range_outlined)),
              DateInput(),
              SizedBox(
                height: 15,
              ),
              Title(title: "Note (Optional)", icon: Icon(Icons.date_range_outlined)),
              NoteInput(),
              SizedBox(
                height: 15,
              ),
              HandleCommit()
            ],
          ),
        ));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xfff2f2f2),
        leadingWidth: 80,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Expense Form",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0.5,
                        color: Colors.grey,
                        offset: Offset(0, 0.5))
                  ]),
              child: const Center(
                child: Icon(
                  Icons.chevron_left,
                  size: 35,
                ),
              ),
            ),
          ),
        ));
  }
}

class SelectedCategory extends StatelessWidget {
  const SelectedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      "Food",
      "Entertainment",
      "Transport",
      "Billing"
    ];
    final selectedOption = TextEditingController();
    final width = MediaQuery.of(context).size.width;
    return DropdownMenu(
        controller: selectedOption,
        textStyle: const TextStyle(fontSize: 16),
        hintText: "Select category",
        width: width*0.9,
        menuStyle:  MenuStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10))),
            backgroundColor:const  WidgetStatePropertyAll(Colors.white)),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        dropdownMenuEntries: options
            .map(
              (option) => DropdownMenuEntry(
                  value: option,
                  label: option,
                  style: const ButtonStyle(
                      textStyle:
                          WidgetStatePropertyAll(TextStyle(fontSize: 18)))),
            )
            .toList());
  }
}

class Title extends StatelessWidget {
  final String title;
  final Icon icon;
  const Title({required this.title, required this.icon, super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        const SizedBox(width: 5,),
        icon,
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff010b13),
              fontSize: 20),
        )
      ],
    );
  }
}

class AmountField extends StatelessWidget {
  const AmountField({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width*0.9,
        height: 60,
        child: Center(
          child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff00712D)),
                    borderRadius: BorderRadius.circular(10)),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ));
  }
}

class DateInput extends ConsumerWidget {
  const DateInput({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(selectedDateProvider);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.9,
      child: TextField(
      style: const TextStyle(fontSize: 16),
      readOnly: true,
      controller: TextEditingController(text: date)
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: date.length),
        ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff00712D)),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onTap: () {
        ref.read(selectedDateProvider.notifier).datePicker(context);
      },
    ),
    );
  }
}

class HandleCommit extends StatelessWidget {
  const HandleCommit({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button("Save"),
      ],
    );
  }

  Widget button(String type) {
    return SizedBox(
      width: 110,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          type,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class NoteInput extends StatelessWidget {
  const NoteInput({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.9,
      child: TextField(
      style: const TextStyle(fontSize: 16),
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff00712D)),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
    );
  }
}
