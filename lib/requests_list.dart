import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class RequestsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestsListState();
  }
}

class RequestsListState extends State<RequestsList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kindlyshare - Requests list')),
      body: getRequestsListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav.showBottomNav(),
    );
  }

  ListView getRequestsListView() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 2.0,
          child: Column(children: [
            new Container(
              child: Image.network('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg'),
            ),
            new ListTile(
              title: Text('Sample item',
                  overflow: TextOverflow.ellipsis, style: TextStyle()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                        //TODO: assign request to yourself?
                      })
                ],
              ),
              onTap: () {
                //TODO: navigate to detail page
              },
            ),
          ]),
        );
      },
    );
  }
}
