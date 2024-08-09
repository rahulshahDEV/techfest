import 'dart:io';

import 'package:byrahul/constant.dart' as s;
import 'package:byrahul/model/blog_model.dart';
import 'package:byrahul/model/speaker.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/services/event_service.dart';
import 'package:byrahul/services/speaker_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/event_model.dart';

class MainProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingEditorPage = false;
  bool isLoadingEventPage = false;
  bool isLoadingSpeeakerPage = false;
  bool isConnected = true;
  File? imagePreviewPath;

  // loading handing for admin ui
  bool isLoadingSubmit = false;
  bool isLoadingSubmitEvent = false;

  void updateInternetStatus({required bool status}) {
    isConnected = status;
    notifyListeners();
  }

  void updateLoadingEvent({required bool status}) {
    isLoadingSubmitEvent = status;
    notifyListeners();
  }

  void updateLoadingSubmitStatus({required bool status}) {
    isLoadingSubmit = status;
    notifyListeners();
  }

  // Status status = Status.;
  s.Status status = s.Status.Published;

  void setStatus({required s.Status sttatus}) {
    status = sttatus;
    notifyListeners();
  }

  void setImagePreview({File? image}) {
    imagePreviewPath = image;
    notifyListeners();
  }

  void setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  void setLoadingEvent(bool status) {
    isLoadingEventPage = status;
    notifyListeners();
  }

  void setLoadingSpeaker(bool status) {
    isLoadingSpeeakerPage = status;
    notifyListeners();
  }

  void setLoadingEditor(bool status) {
    isLoadingEditorPage = status;
    notifyListeners();
  }

  List<IconData> myIcons = [
    Icons.home,
    Icons.newspaper,
    Icons.calendar_month,
    Icons.group,
    Icons.login
    // Icons.local_activity
  ];

  void updateIcons({required IconData icon}) {
    myIcons.add(icon);
    notifyListeners();
  }

  List<String> konsaPage = ['Home', 'Blogs', 'Event', 'Teams', 'login'];

  void addKonsaPage({required String page}) {
    konsaPage.add(page);
    notifyListeners();
  }

  int selectedIndex = 0;

  void updateTabIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  ///
  ///
  // double scaleCard = 1;

  // void scaleDown() {
  //   scaleCard = 0.9;
  //   notifyListeners();
  // }

  // void scaleUp() {
  //   scaleCard = 1.0;
  //   notifyListeners();
  // }
  //Events

  List<Event> events = [];
  getEvents({int page = 1}) async {
    try {
      final eventData = await EventService.getEvents(page: page);

      if (page == 1) {
        events = [...eventData!.events];
      }
      if (page > 1) {
        events = [...events, ...eventData!.events];
      }
    } on DioException catch (e) {
      print(e.message.toString() + ' from monkey man');
    }
    notifyListeners();
  }

  deleteEvents({required String id}) {
    events.removeWhere(
      (element) => element.id == id,
    );
    notifyListeners();
  }

  // Speaker provider

  List<SpeakerElement> speakers = [];
  getSpeaker({int page = 1}) async {
    final speakerData = await SpeakerService.getSpeaker(page: page);

    if (page == 1) {
      speakers = [...speakerData.speakers];
    }
    if (page > 1) {
      speakers = [...speakers, ...speakerData.speakers];
    }
    notifyListeners();
  }

  deleteSpeaker({required String id}) {
    speakers.removeWhere(
      (element) => element.id == id,
    );
    notifyListeners();
  }

  List<Blog> blogs = [];

  getBlogs({int page = 1}) async {
    final data = await BlogService.getBlogs(page: page);

    if (page == 1) {
      blogs = [...data?.blogs ?? []];
    }

    if (page > 1) {
      blogs = [...blogs, ...data!.blogs];
    }
    notifyListeners();
  }

  deleteBlogs({required int index}) {
    blogs.removeAt(index);
    notifyListeners();
  }

  void updatePage() {
    notifyListeners();
  }

  bool isPasswordNotVisible = true;
  void passwordVisibility() {
    isPasswordNotVisible = !isPasswordNotVisible;
    notifyListeners();
  }
}
