import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class ListPageTest extends StatefulWidget {
  @override
  _ListPageTestState createState() => _ListPageTestState();
}

class _ListPageTestState extends State<ListPageTest> {

  Stream<QuerySnapshot> _requestlist;

  @override
  void initState(){
    super.initState();
    _requestlist = Firestore.instance
                  .collection('request_list')
                  .orderBy('requestTitle')
                  .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KindlyShare'),
      ),
    body: StreamBuilder<QuerySnapshot>(
      stream: _requestlist,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if(!snapshot.hasData){
          return Center(child: const Text('Loading...'));
        }

        return Stack (
          children: [
            RequestList(documents: snapshot.data.documents),
          ],
        );
      
      },
    ),
      
    );
  }
}

class RequestList extends StatelessWidget {
  const RequestList({
    Key key,
    @required this.documents,
  }) : super(key:key);

  final List<DocumentSnapshot> documents;


  @override
  Widget build(BuildContext context) {
    return RequestListItems(
      documents: documents,
    );
  }
}

class RequestListItems extends StatelessWidget {
  const RequestListItems ({
    Key key,
    @required this.documents,
  }) : super (key:key);

final List<DocumentSnapshot> documents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: documents.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 340,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Card(
              child: Center(
                child: RequestListItemTile(
                  document: documents[index],
                ),
              ),
            ),
          ),
        );
      },
      
    );
  }
}

class RequestListItemTile extends StatefulWidget {
  const RequestListItemTile({
    Key key,
    @required this.document,
  }) : super(key: key);

  final DocumentSnapshot document;

  @override
  State<StatefulWidget> createState() {
    return _RequestListItemTileState();
  }
}

class _RequestListItemTileState extends State<RequestListItemTile> {
 

  @override
  Widget build(BuildContext context) {
    return Ink(
          child: ListTile(
        title: Text(widget.document['requestTitle'] as String),
        subtitle: Text(widget.document['description'] as String),
        leading: Container(
          width: 130,
          height: 100,
          child:Container(
            child: Center(child: Row(
              children: [
                Text('Other Text:'),
              ],
            ),),
          ),
        ),
        onTap: () async {
        },
      ),
    );
  }
}