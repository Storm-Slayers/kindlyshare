import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindlyshare/components/UI_components.dart';
import 'package:kindlyshare/screens/viewRequest/requestDetail.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  Stream<QuerySnapshot> _requestlist;
  String userID;
  String title_text = 'Requests list';

  getUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    this.userID = user.uid;

    _requestlist = Firestore.instance
        .collection('request_list')
        .orderBy('requestName')
        .where('userID', isEqualTo: this.userID)
        .snapshots();
  }

  @override
  void initState() {
    super.initState();

    getUser().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.createAppBar('My requests'),
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
  pushRequestDetails() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RequestDetail(reqDetail: widget.document)));
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: ListTile(
        title: Text(widget.document['requestName'] as String),
        subtitle: Text(widget.document['requestDesc'] as String),
        leading: Container(
          width: 130,
          height: 100,
          child: Container(
            child: Center(
              child: Row(
                children: [
                  Text(widget.document['requestDate'] as String),
                ],
              ),
            ),
          ),
        ),
        onTap: () async {
          pushRequestDetails();
        },
      ),
    );
  }
}