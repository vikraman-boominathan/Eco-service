import 'package:hive/hive.dart';

part 'community.g.g.dart';

@HiveType(typeId: 0)
class Community extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String location;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String gatePhotoFileName;
  @HiveField(4)
  final double lat;
  @HiveField(5)
  final double long;

  Community({
    required this.id,
    required this.location,
    required this.name,
    required this.gatePhotoFileName,
    required this.lat,
    required this.long,
  });
}
