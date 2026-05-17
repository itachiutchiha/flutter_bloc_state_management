import 'package:state_management_learn/core/constants/api_constants.dart';

class CharacterModel {
  final String name;
  final String fullName;
  final String imageUrl;
  final String birthday;
  final List<dynamic> jobs;
  final String episodesCount;
  final String serieName;
  final String actorName;

  CharacterModel(
      {required this.name,
      required this.fullName,
      required this.imageUrl,
      required this.birthday,
      required this.jobs,
      required this.episodesCount,
      required this.serieName,
      required this.actorName});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        name: json[ApiKeys.name],
        fullName: json[ApiKeys.fullName],
        imageUrl: json[ApiKeys.image],
        birthday: json[ApiKeys.birthday],
        jobs: json[ApiKeys.jobs],
        episodesCount: json[ApiKeys.episodesCount],
        serieName: json[ApiKeys.serieName],
        actorName: json[ApiKeys.actorName]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.fullName: fullName,
      ApiKeys.image: imageUrl,
      ApiKeys.birthday: birthday,
      ApiKeys.jobs: jobs,
      ApiKeys.episodesCount: episodesCount,
      ApiKeys.serieName: serieName,
      ApiKeys.actorName: actorName,
    };
  }
}
