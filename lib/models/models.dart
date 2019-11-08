// Embedded Maps

class MeatEntry {
  String description;
  String type;
  bool processed;
  int amount;
  DateTime datetime;

  MeatEntry({this.description, this.type, this.processed, this.amount, this.datetime});

  MeatEntry.fromMap(Map data) {
    description = data['description'] ?? '';
    type = data['type'];
    processed = data['processed'] ?? false;
    amount = data['quantity'] ?? 0;
    datetime = data['datetime'];
  }
}

// Database Collections

class User {
  String uid;
  List<MeatEntry> meatEntries;

  User({this.uid, this.meatEntries});

  factory User.fromMap(Map data) {
    return User(uid: data['uid'] ?? '', meatEntries: (data['meatEntries'] as List ?? []).map((v) => MeatEntry.fromMap(v)).toList());
  }
}

class UserData {
  final String uid;
  final String username;

  UserData({this.uid, this.username});
}
