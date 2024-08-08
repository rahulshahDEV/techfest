import 'package:auto_route/auto_route.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/model/event_model.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/event_service.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:byrahul/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    Provider.of<MainProvider>(context, listen: false).getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Event> events = context.watch<MainProvider>().events;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(
              CustomEditorPageRoute(appbarTitle: 'Add Event', linkExist: true));
        },
        child: const Icon(Icons.add),
      ),
      appBar: const MyAppBar(title: 'Event'),
      body: ListView(
        children: [
          ...events.map(
            (e) => customCardWidget(
                imagePath: e.eventImage.url,
                name: e.title,
                context: context,
                link: e.link,
                description: e.description,
                id: e.id),
          )
        ],
      ),
    );
  }
}
