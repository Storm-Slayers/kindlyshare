import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindlyshare/components/colors.dart';
import 'package:kindlyshare/components/UI_components.dart';
import 'package:kindlyshare/loading.dart';

class ListPageTest extends StatefulWidget {
  @override
  _ListPageTestState createState() => _ListPageTestState();
}

class _ListPageTestState extends State<ListPageTest> {
  Stream<QuerySnapshot> _requestlist;

  @override
  void initState() {
    super.initState();
    _requestlist = Firestore.instance
        .collection('request_list')
        .orderBy('requestName')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.createAppBar('Requests list'),
      backgroundColor: AppColors.bg_color,
      body: StreamBuilder<QuerySnapshot>(
        stream: _requestlist,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: const Text('Loading...'));
          }

          return Stack(
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
  }) : super(key: key);

  final List<DocumentSnapshot> documents;

  @override
  Widget build(BuildContext context) {
    return RequestListItems(
      documents: documents,
    );
  }
}

class RequestListItems extends StatelessWidget {
  const RequestListItems({
    Key key,
    @required this.documents,
  }) : super(key: key);

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
    return Card(
      color: Colors.white,
      elevation: 100.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.bottomnav_iccolor,
          child: Text('Us',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        title: Text(widget.document['requestName'] as String,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(widget.document['requestDate'] as String),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Row(
                children: [
                  Text(widget.document['requestDesc'] as String),
                ],
              ),
            ),
           
          ],
        ),
        onTap: () {},
      ),
    );
  }

  getUserFirstLetter(String userInitials) {
    return userInitials.substring(0, 2);
  }
}

