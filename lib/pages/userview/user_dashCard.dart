import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/model/userView_model.dart' as userhome;
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:byrahul/widgets/prize_card.dart';
import 'package:byrahul/widgets/sponsors_card.dart';
import 'package:byrahul/widgets/userview_speakercard.dart';
import 'package:flutter/material.dart';

Widget dashCard(
    {required userhome.UserviewHome userhome,
    int? type,
    required int index,
    required BuildContext context}) {
  switch (type) {
    case 1:
      return speakerCard(userhome: userhome, index: index, context: context);
    case 2:
      return prizeCard(userhome: userhome, index: index, context: context);
    case 3:
      return sponsorsCard(userhome: userhome, index: index, context: context);
    default:
      return Container();
  }
}

// class kdfkj {
//   Widget dklfhkjd() {
//     return Divider();
//   }
// }
