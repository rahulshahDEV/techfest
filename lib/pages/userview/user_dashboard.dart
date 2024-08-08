import 'package:byrahul/pages/userview/user_customCard.dart';
import 'package:byrahul/pages/userview/user_dashCard.dart';
import 'package:byrahul/services/userview_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:byrahul/widgets/error_widget.dart';
import 'package:flutter/material.dart';

Widget userDashboard() {
  return RefreshIndicator(
    color: Palette.primary,
    onRefresh: () => UserViewService.getUserHome(),
    child: ListView(physics: const BouncingScrollPhysics(), children: [
      FutureBuilder(
        future: UserViewService.getUserHome(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.symmetric(
                // horizontal: 20,
                vertical: 18,
              ),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      putPadding: true,
                      text: 'Speaker',
                      colour: Colors.grey.shade800,
                      fontSize: 22),
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.speakers.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(left: 20),
                        child: dashCard(
                            context: context,
                            userhome: snapshot.data!,
                            index: index,
                            type: 1),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                  customText(
                      putPadding: true,
                      text: 'Prizes',
                      colour: Colors.grey.shade800,
                      fontSize: 22),
                  Container(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.prizes.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8).copyWith(left: 20),
                          child: dashCard(
                              userhome: snapshot.data!,
                              index: index,
                              context: context,
                              type: 2),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                      )),
                  customText(
                      putPadding: true,
                      text: 'Sponsors',
                      colour: Colors.grey.shade800,
                      fontSize: 22),
                  SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.sponsors.length,
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8).copyWith(left: 20),
                            child: dashCard(
                                userhome: snapshot.data!,
                                type: 3,
                                index: index,
                                context: context)),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 0,
                        ),
                      ))
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return errorWidget(error: snapshot.error.toString());
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Palette.primary,
                ),
              ),
            );
          }
        },
      ),
    ]),
  );
}
