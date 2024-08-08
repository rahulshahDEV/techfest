import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class textfieldToolBar extends StatelessWidget {
  const textfieldToolBar({
    super.key,
    required QuillController controller,
  }) : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 3),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Palette.territory_white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: QuillEditor.basic(
        configurations: QuillEditorConfigurations(
          controller: _controller,
        ),
      ),
    );
  }
}
