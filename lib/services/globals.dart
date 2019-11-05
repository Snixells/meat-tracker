import 'package:meattracker/models/models.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

/// Static global state. Immutable services that do not care about build context.
class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  // static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  static final Map models = {User: (data) => User.fromMap(data)};

  // Firestore References for Writes
  // static final Collection<Topic> topicsRef = Collection<Topic>(path: 'topics');
  // static final UserData<Report> reportRef =
  //     UserData<Report>(collection: 'reports');
}
