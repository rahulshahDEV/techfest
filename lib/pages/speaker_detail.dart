import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/services/speaker_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SpeakerDetail extends StatelessWidget {
  const SpeakerDetail({super.key, this.id});
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SpeakerService.getSpeakerById(id: id!),
        builder: (context, snapshot) => snapshot.hasData
            ? Stack(children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(snapshot
                                  .data!.speakerImage.url
                                  .validateApiUri()),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                    const TextSpan(text: 'Position : '),
                                    TextSpan(text: snapshot.data!.position)
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                    const TextSpan(text: 'Status : '),
                                    TextSpan(text: snapshot.data!.status)
                                  ])),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customText(
                              text: snapshot.data!.name,
                              colour: Colors.red,
                              toCapitalize: true),
                          const SizedBox(
                            height: 10,
                          ),
                          customText(
                              text: snapshot.data!.description!,
                              colour: Colors.black),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 25,
                  child: IconButton(
                      onPressed: () => context.router.maybePop(),
                      icon: const Icon(Icons.arrow_back)),
                )
              ])
            : Center(
                child: CircularProgressIndicator(
                  color: Palette.primary,
                ),
              ),
      ),
    );
  }
}
