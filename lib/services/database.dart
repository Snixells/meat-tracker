import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meattracker/models/models.dart';
import 'package:meattracker/services/auth.dart';

class DatabaseService {
  final String uid;
  AuthService _auth = AuthService();

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference usersDataCollection = Firestore.instance.collection('usersTest');

  Future addTrackedMeat(String description, String type, int amount, bool processed, DateTime datetime) async {
    String uid = await _auth.currentUserUid();
    DocumentReference newDocRef = await usersDataCollection.document(uid).collection('meatTracks').add(
      {'description': description, 'type': type, 'amount': amount, 'processed': processed, 'datetime': datetime},
    );
    print('Created new Doc ${newDocRef.documentID} at path ${newDocRef.path}');
    return newDocRef;
  }

  List<MeatEntry> _meatEntryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return MeatEntry(
        description: doc['description'] ?? '',
        type: doc['type'],
        processed: doc['processed'] ?? false,
        amount: doc['amount'] ?? 0,
        datetime: doc['datetime'].toDate(),
      );
    }).toList();
  }

  Stream<List<MeatEntry>> get meatEntries {
    return usersDataCollection.document(uid).collection('meatTracks').snapshots().map(_meatEntryListFromSnapshot);
  }
}
