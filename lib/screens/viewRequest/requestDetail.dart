import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kindlyshare/Services/firestoreService.dart';

class RequestDetail extends StatefulWidget {
  final DocumentSnapshot reqDetail;

  RequestDetail({this.reqDetail});

  @override
  _RequestDetailState createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  FirestoreService storeService = new FirestoreService();

  deleteRequest(String requestID) {
    storeService.removeRequest(requestID).then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reqDetail['requestName'] as String),
      ),
      body: Container(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
                width: 100.0,
              ),
              Text(widget.reqDetail['requestDate'] as String),
              Text(widget.reqDetail['requestDesc'] as String),
              RaisedButton(
                  onPressed: () {
                    deleteRequest(widget.reqDetail.documentID);
                  },
                  child: const Text('Delete- dont do it'))
            ],
          ),
        ),
      )),
    );
  }
}
