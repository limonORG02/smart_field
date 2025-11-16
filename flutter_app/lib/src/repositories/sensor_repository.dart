import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/sensor_data.dart';


class SensorRepository {
final FirebaseFirestore _db = FirebaseFirestore.instance;


Stream<List<SensorReading>> readingsStream(String fieldId) {
return _db.collection('sensors').doc(fieldId).collection('readings')
.orderBy('timestamp', descending: true)
.limit(100)
.snapshots()
.map((snap) => snap.docs.map((d) => SensorReading(
temperature: (d.data()['temperature'] as num?)?.toDouble(),
humidity: (d.data()['humidity'] as num?)?.toDouble(),
ndvi: (d.data()['ndvi'] as num?)?.toDouble(),
timestamp: (d.data()['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
)).toList());
}
}
