import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/model/speaker.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:byrahul/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SpeakerPage extends StatefulWidget {
  const SpeakerPage({super.key});

  @override
  State<SpeakerPage> createState() => _SpeakerState();
}

class _SpeakerState extends State<SpeakerPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MainProvider>(context, listen: false).getSpeaker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SpeakerElement> speakers =
        context.watch<MainProvider>().speakers;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router
              .push(CustomEditorPageRoute(appbarTitle: 'Add Speaker'));
        },
        child: const Icon(Icons.add),
      ),
      appBar: const MyAppBar(title: 'Speaker'),
      body: ListView(
        children: [
          ...speakers.map(
            (e) => customCardWidget(
                context: context,
                imagePath: e.speakerImage.url.validateApiUri(),
                name: e.name,
                position: e.position,
                id: e.id,
                description: e.description.toString()),
          ),
        ],
      ),
    );
  }
}
