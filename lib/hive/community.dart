import 'package:hive/hive.dart';

part 'community.g.dart';

@HiveType(typeId: 1)
class Community extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String location;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late String gate_photo_file_name;
  @HiveField(4)
  late double lat;
  @HiveField(5)
  late double long;

  Community({
    required this.id,
    required this.location,
    required this.name,
    required this.gate_photo_file_name,
    required this.lat,
    required this.long,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['community_id'] as String? ?? '',
      location: json['community_location'] as String? ?? '',
      name: json['community_name'] as String? ?? '',
      gate_photo_file_name: json['gate_photo_file_name'] as String? ?? '',
      lat: json['latitude'] as double? ?? 0.0,
      long: json['longtitude'] as double? ?? 0.0,
    );
  }
}
