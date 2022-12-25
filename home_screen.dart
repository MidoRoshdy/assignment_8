import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/core/text_styles.dart';
import 'package:whatsapp/screens/contact/contact_screen.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_calls_page/home_calls_page.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_chats_page/home_chats_page.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_groups_page/home_groups_page.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_status_page/home_status_page.dart';
import 'package:whatsapp/screens/home_screen/search_screen/component_search.dart';
import 'package:whatsapp/screens/home_screen/search_screen/search_screen.dart';
import 'package:whatsapp/screens/story/story_screen.dart';

import '../../core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text("WhatsApp"),
          actions: [
            InkWell(
                onTap: () {},
                child: Container(width: 40, child: Icon(Icons.access_alarm))),
            InkWell(
                onTap: () {},
                child: Container(width: 40, child: Icon(Icons.camera_alt))),
            InkWell(
                onTap: () async {
                  showSearch(
                      context: context,
                      delegate: SearchWidget([
                        "mohamed",
                        "aya",
                        "zain",
                        "waleed",
                        "ashraf",
                        "desko"
                      ]));
                },
                child: Container(width: 40, child: Icon(Icons.search))),
            InkWell(
                onTap: () async {
                  String? option = await showMenu(
                      context: context,
                      position: RelativeRect.fromDirectional(
                          textDirection: TextDirection.ltr,
                          start: 1,
                          end: 0,
                          top: 0,
                          bottom: 0),
                      items: [
                        PopupMenuItem<String>(
                          value: "One",
                          child: Text('New group'),
                        ),
                        PopupMenuItem(
                          value: "Two",
                          child: Text('New broadcast'),
                        ),
                        PopupMenuItem(
                          value: "Three",
                          child: Text('Linked devices'),
                        ),
                      ]);
                  if (option != null) {
                    switch (option) {
                      case "One":
                        Navigator.of(context).pushNamed("/");
                        break;
                      case "Two":
                        print("Here is Two");
                        break;
                      case "Three":
                        print("Here is Three");
                        break;
                      default:
                        print("Here is default");
                    }
                  } else {
                    print("No Action");
                  }
                },
                child:
                    Container(width: 40, child: Icon(Icons.more_vert_rounded))),
          ],
          bottom: TabBar(
            tabs: [
              Container(
                  height: 40,
                  width: screenSize.width * .07,
                  child: Icon(Icons.groups)),
              Container(
                  height: 40,
                  width: screenSize.width * .20,
                  alignment: Alignment.center,
                  child: Text("Chats".toUpperCase())),
              Container(
                  height: 40,
                  width: screenSize.width * .20,
                  alignment: Alignment.center,
                  child: Text("Status".toUpperCase())),
              Container(
                  height: 40,
                  width: screenSize.width * .20,
                  alignment: Alignment.center,
                  child: Text("Calls".toUpperCase())),
            ],
            indicatorWeight: 3,
            isScrollable: true,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          HomeGroupsPage(),
          ContactScreen(),
          StoryScreen(),
          HomeCallsPage(),
        ]),
      ),
    );
  }
}
