import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width = double.infinity,
      this.icon,
      this.setMargin = false,
      this.height = 80,
      this.colour});
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? colour;
  final double height;
  final double width;
  final bool setMargin;

  @override
  Widget build(BuildContext context) {
    final _isloadingBlog = context.watch<MainProvider>().isLoadingSubmit;
    final _isloadingEvent = context.watch<MainProvider>().isLoadingSubmitEvent;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: setMargin
            ? const EdgeInsets.symmetric(vertical: 15, horizontal: 2)
            : null,
        decoration: BoxDecoration(
          borderRadius: setMargin ? BorderRadius.circular(10) : null,
          color: colour ?? Palette.primary,
        ),
        padding: icon != null
            ? const EdgeInsets.all(8).copyWith(left: 40)
            : const EdgeInsets.all(8),
        width: width,
        height: height,
        child: _isloadingBlog || _isloadingEvent
            ? CircularProgressIndicator()
            : Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.space,
                children: [
                  Icon(icon),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    label,
                    style:
                        TextStyle(color: Palette.territory_white, fontSize: 22),
                  )
                ],
              ),
      ),
    );
  }

  ElevatedButton jdfgh() {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: Palette.territory_white,
        size: 30,
      ),
      onPressed: onPressed,
      style: ButtonStyle(
          alignment: Alignment.centerLeft,
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40)),
          backgroundColor:
              WidgetStateProperty.all<Color>(colour ?? Palette.primary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
      label: Text(
        label,
        style: TextStyle(
            color: Palette.territory_white,
            fontSize: 25,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
