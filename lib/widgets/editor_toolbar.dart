import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class editorToolbar extends StatelessWidget {
  const editorToolbar({
    super.key,
    required QuillController controller,
  }) : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(25)
              .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: QuillToolbar.simple(
          configurations: QuillSimpleToolbarConfigurations(
              showLink: false,
              controller: _controller,
              showFontFamily: false,
              showFontSize: false,
              showClipboardCut: false,
              showClipboardCopy: false,
              showClipboardPaste: false,
              toolbarIconAlignment: WrapAlignment.center),
        ),
      ),
    );
  }
}
