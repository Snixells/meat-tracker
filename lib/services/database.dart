import 'package:cloud_firestore/cloud_firestore.dart';
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
      {'description': description, 'type': type, 'amount': amount, 'processed': processed, 'date': datetime},
    );
    print('Created new Doc ${newDocRef.documentID} at path ${newDocRef.path}');
    return newDocRef;
  }
}
