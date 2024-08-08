import 'package:byrahul/constant.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dropfield extends StatelessWidget {
  const Dropfield({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<MainProvider>().status;
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      child: DropdownButton(
        value: value,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: Status.values.map((Status items) {
          return DropdownMenuItem(
            value: items,
            child: customText(
                fontSize: 18,
                text: items.toString().replaceAll('Status.', ''),
                fontBold: false,
                colour: Colors.black),
          );
        }).toList(),
        onChanged: (value) {
          context.read<MainProvider>().setStatus(sttatus: value!);
        },
      ),
    );
  }
}
