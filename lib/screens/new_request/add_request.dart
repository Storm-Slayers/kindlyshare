import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kindlyshare/Services/firestoreService.dart';
import 'package:kindlyshare/models/requests.dart';
import 'package:kindlyshare/components/UI_components.dart';

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

  createRequest() {
    storeService
        .createRequest(
            _requestListNameController.text,
            _requestListDateController.text,
            _requestListDescController.text,
            'test')
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
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _requestListNameController,
                decoration: InputDecoration(labelText: 'Title: '),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _requestListDateController,
                decoration: InputDecoration(labelText: 'Date: '),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _requestListDescController,
                decoration: InputDecoration(labelText: 'Description: '),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                RaisedButton(
                    onPressed: () {
                      _requestListNameController.text.trim() == ""
                          ? NewAlertDialog.showAlertDialog(
                              context,
                              "Write something",
                              "Insert a value in the title field to save.")
                          : createRequest();
                    },
                    child: const Text('Submit'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
