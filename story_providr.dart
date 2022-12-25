import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/screens/contact/provider/ContactState.dart';
import 'package:whatsapp/screens/story/provider/story_state.dart';
import '../../../core/enums.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/core/enums.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

class Storyprovider extends ChangeNotifier {
  storystate state = storystate();

  Future Getdata() async {
    state.states = ScreenStates.loading;
    var response = await http.get(Uri.parse(
        "https://63950d904df9248eadb282fd.mockapi.io/api/v1/stories"));
    if (response.statusCode == 404) {
      state.states = ScreenStates.notFound;
      notifyListeners();
    }
    if (response.statusCode == 200) {
      state.story = json.decode(response.body);
      state.states = ScreenStates.done;
      notifyListeners();
    }
  }
}
