class SensorReading {
final double? temperature;
final double? humidity;
final double? ndvi;
final DateTime timestamp;


SensorReading({this.temperature, this.humidity, this.ndvi, required this.timestamp});


factory SensorReading.fromMap(Map<String, dynamic> map) {
return SensorReading(
temperature: (map['temperature'] as num?)?.toDouble(),
humidity: (map['humidity'] as num?)?.toDouble(),
ndvi: (map['ndvi'] as num?)?.toDouble(),
timestamp: (map['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
);
}
}
