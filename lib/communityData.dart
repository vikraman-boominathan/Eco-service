class CommunityData {
  final String date;
  final String communityId;
  final int mixedBags;
  final int glassBags;
  final int plasticBags;
  final int paperBags;
  final int segLfBags;
  final int sanitoryBags;
  final double kgOfGlass;
  final double kgOfMixed;
  final double kgOfPlastic;
  final double kgOfPaper;
  final double kgOfSegLf;
  final double kgOfSanitory;
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
    required this.kgOfGlass,
    required this.kgOfMixed,
    required this.kgOfPlastic,
    required this.kgOfPaper,
    required this.kgOfSegLf,
    required this.kgOfSanitory,
    this.comments,
  });

  factory CommunityData.fromJson(Map<String, dynamic> json) {
    return CommunityData(
      date: json['date'],
      communityId: json['community_id'],
      mixedBags: json['mixed_bags'],
      glassBags: json['glass_bags'],
      plasticBags: json['plastic_bags'],
      paperBags: json['paper_bags'],
      segLfBags: json['seg_lf_bags'],
      sanitoryBags: json['sanitory_bags'],
      kgOfGlass: json['kg_of_glass'],
      kgOfMixed: json['kg_of_mixed'],
      kgOfPlastic: json['kg_of_plastic'],
      kgOfPaper: json['kg_of_paper'],
      kgOfSegLf: json['kg_of_seg_lf'],
      kgOfSanitory: json['kg_of_sanitory'],
      comments: json['comments'],
    );
  }
}
