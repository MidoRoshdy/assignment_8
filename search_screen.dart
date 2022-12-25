import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  List<String> tagsList = [
    "Unread",
    "Images",
    "Videos",
    "Links",
    "GIFs",
    "Audio",
    "Documentation"
  ];
  // List<Widget> tagsListWidgets = [];

  @override
  Widget build(BuildContext context) {
    // tagsList.forEach((element) {
    //   tagsListWidgets.add(Container(
    //     decoration: BoxDecoration(
    //         color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
    //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    //     margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    //     child: Text(element),
    //   ));
    // });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            // search bar
            Container(
              height: 60,
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search..."),
                  ))
                ],
              ),
            ),

            // tags
            Container(
                child: Wrap(
              children: tagsList
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(e),
                      ))
                  .toList(),
            )),

            SizedBox(
              height: 16,
            ),
            Divider(
              height: 0,
              color: Colors.black54,
            ),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              separatorBuilder: (ctx, index) => SizedBox(
                height: 16,
              ),
              itemBuilder: (ctx, index) => Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://wallpaperaccess.com/full/51391.jpg",
                        height: 44,
                        width: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohamed Abdelhady",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Hi Pro",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                    Text("7:38",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.grey.shade600)),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
