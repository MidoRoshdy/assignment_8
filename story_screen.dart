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
import 'package:whatsapp/screens/contact/provider/ContactProvider.dart';
import 'package:whatsapp/screens/story/provider/story_providr.dart';

class StoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<Storyprovider>().Getdata();
    return Scaffold(body: screenBody());
  }

  Widget screenBody() {
    return Consumer<Storyprovider>(builder: (ctx, provider, _) {
      if (provider.state.states == ScreenStates.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (provider.state.states == ScreenStates.notFound) {
        return Center(
          child: (Text(
            "Not Found ",
            style: TextStyle(fontSize: 30),
          )),
        );
      }

      return Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                itemCount: provider.state.story!.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic>? item = provider.state.story![index];
                  return Container(
                    margin: EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 70,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  NetworkImage(item!["user_photo"]),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 100,
                            width: 200,
                            alignment: Alignment.topLeft,
                            child: Column(children: [
                              Text(
                                item["username"],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                }),
          ),
        ],
      ));
    });
  }
}
