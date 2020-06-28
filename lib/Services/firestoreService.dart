import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindlyshare/models/requests.dart';

final CollectionReference requestCollection = Firestore.instance.collection('request_list');

class FirestoreService {

  Future<Requests> createRequest(String requestName, String requestDesc, String requestDate, String userID) async {
    final TransactionHandler newTransaction = (Transaction tx) async {
      final DocumentSnapshot snapshot = await tx.get(requestCollection.document());

      final Requests request = Requests(requestName,requestDesc,requestDate,userID);
      final Map<String,dynamic> data = request.toMap();

      await tx.set(snapshot.reference, data);
      return data;
    };

    return Firestore.instance.runTransaction(newTransaction).then((mapData){
      return Requests.fromMap(mapData);
    }).catchError((onError){
      print('error:$onError');
      return null;
    });
  }

  Stream<QuerySnapshot> getRequestList({int offset, int limit}){
    Stream<QuerySnapshot> listSnapshot = requestCollection.snapshots();
    if(offset != null) {
      listSnapshot = listSnapshot.skip(offset);
    }
        if(limit != null) {
      listSnapshot = listSnapshot.skip(offset);
    }

    return listSnapshot;
  }
}