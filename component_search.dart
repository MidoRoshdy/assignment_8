import 'package:flutter/material.dart';

class SearchWidget extends SearchDelegate {
  List<String> tagsList = [
    "Unread",
    "Images",
    "Videos",
    "Links",
    "GIFs",
    "Audio",
    "Documentation"
  ];

  SearchWidget(this.contacts);

  String? selectedContact;
  List<String> contacts = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: Container(
            height: 110,
            width: double.infinity,
            child: Wrap(
              children: tagsList
                  .map((e) => Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade300),
                        child: Text(e),
                      ))
                  .toList(),
            )));
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedContact!),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sortedContacts = [];
    sortedContacts =
        contacts.where((element) => element.contains(query)).toList();
    print(sortedContacts.toString());
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          print('right');
          Navigator.pop(context);
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          print('left');
          Navigator.pop(context);
        }
      },
      child: ListView.separated(
          padding: EdgeInsets.only(top: 16),
          itemBuilder: (ctx, index) {
            final item = sortedContacts[index];
            return InkWell(
              onTap: () {
                selectedContact = item;
                showResults(context);
              },
              child: Container(
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
                            item,
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
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 8,
            );
          },
          itemCount: sortedContacts.length),
    );
  }
}
