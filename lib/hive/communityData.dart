import 'package:hive/hive.dart';

part 'communityData.g.dart';

@HiveType(typeId: 3)
class CommunityData {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final String communityId;

  @HiveField(2)
  final int mixedBags;

  @HiveField(3)
  final int glassBags;

  @HiveField(4)
  final int plasticBags;

  @HiveField(5)
  final int paperBags;

  @HiveField(6)
  final int segLfBags;

  @HiveField(7)
  final int sanitoryBags;

  @HiveField(8)
  final double? kgOfGlass;

  @HiveField(9)
  final double? kgOfMixed;

  @HiveField(10)
  final double? kgOfPlastic;

  @HiveField(11)
  final double? kgOfPaper;

  @HiveField(12)
  final double? kgOfSegLf;

  @HiveField(13)
  final double? kgOfSanitory;

  @HiveField(14)
  final String? comments;

  CommunityData({
    required this.date,
    required this.communityId,
    required this.mixedBags,
    required this.glassBags,
    required this.plasticBags,
    required this.paperBags,
    required this.segLfBags,
    required this.sanitoryBags,
    this.kgOfGlass,
    this.kgOfMixed,
    this.kgOfPlastic,
    this.kgOfPaper,
    this.kgOfSegLf,
    this.kgOfSanitory,
    this.comments,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'community_id': communityId,
      'mixed_bags': mixedBags,
      'glass_bags': glassBags,
      'plastic_bags': plasticBags,
      'paper_bags': paperBags,
      'seg_lf_bags': segLfBags,
      'sanitory_bags': sanitoryBags,
      'kg_of_glass': kgOfGlass,
      'kg_of_mixed': kgOfMixed,
      'kg_of_plastic': kgOfPlastic,
      'kg_of_paper': kgOfPaper,
      'kg_of_seg_lf': kgOfSegLf,
      'kg_of_sanitory': kgOfSanitory,
      'comments': comments,
    };
  }
}