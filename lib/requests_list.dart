import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Kindlyshare - Requests list')
      ),
      body: getRequestsListView(),
    );
  }

  ListView getRequestsListView() {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Sample item',
              overflow: TextOverflow.ellipsis,
              style: TextStyle()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.edit
                    ),
                    onTap: () {
                      //TODO: assign request to yourself?
                    }
                  )
                ],
              ),
              onTap: () {
              //TODO: navigate to detail page
            },
            ),
          );
        },
        );
  }
}
