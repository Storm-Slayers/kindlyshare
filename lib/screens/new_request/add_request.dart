import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kindlyshare/Services/firestoreService.dart';
import 'package:kindlyshare/models/requests.dart';
import 'package:kindlyshare/components/UI_components.dart';
import 'package:kindlyshare/components/colors.dart';

class AddRequestPage extends StatefulWidget {
  final Requests request;
  AddRequestPage(this.request);

  @override
  _AddRequestPageState createState() => _AddRequestPageState();
}

class _AddRequestPageState extends State<AddRequestPage> {
  FirestoreService storeService = new FirestoreService();

  TextEditingController _requestListNameController;
  TextEditingController _requestListDateController;
  TextEditingController _requestListDescController;
  String userID;

  createRequest() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    this.userID = user.uid;

    storeService
        .createRequest(
            _requestListNameController.text,
            _requestListDateController.text,
            _requestListDescController.text,
            this.userID)
        .then((_) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _requestListNameController =
        new TextEditingController(text: widget.request.requestName);
    _requestListDateController =
        new TextEditingController(text: widget.request.requestDate);
    _requestListDescController =
        new TextEditingController(text: widget.request.requestDesc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 80,
        child: ListView(
          children: [
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _requestListNameController,
                decoration: InputDecoration(labelText: 'Title: '),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _requestListDateController,
                decoration: InputDecoration(labelText: 'Description: '),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _requestListDescController,
                decoration: InputDecoration(labelText: 'Date: '),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.blueGrey[300],
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: AppColors.button_gradient2,
                    onPressed: () {
                      _requestListNameController.text.trim() == ""
                          ? NewAlertDialog.showAlertDialog(
                              context,
                              "Write something",
                              "Insert a value in the title field to save.")
                          : createRequest();
                    },
                    child: const Text('Submit',
                     style: TextStyle(color: Colors.white),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
