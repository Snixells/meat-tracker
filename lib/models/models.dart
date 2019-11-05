// Embedded Maps

class MeatEntry {
  String type;
  bool processed;
  int quantity;
  DateTime datetime;

  MeatEntry({this.type, this.processed, this.quantity, this.datetime});

  MeatEntry.fromMap(Map data) {
    type = data['type'];
    processed = data['processed'] ?? false;
    quantity = data['quantity'] ?? 0;
    datetime = data['datetime'];
  }
}

// Database Collections

class User {
  String uid;
  List<MeatEntry> meatEntries;

  User({this.uid, this.meatEntries});

  factory User.fromMap(Map data) {
    return User(
        uid: data['uid'] ?? '',
        meatEntries: (data['meatEntries'] as List ?? [])
            .map((v) => MeatEntry.fromMap(v))
            .toList());
  }
}
