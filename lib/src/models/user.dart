import 'package:masterclass_app/src/models/favorite_technologies.dart';
import 'package:masterclass_app/src/models/skills_competences.dart';
import 'package:masterclass_app/src/models/social_network.dart';

class UserModel {
  final String name;
  final String description;
  final List<SocialNetWorkModel> socialNetWork;
  final List<FavoriteTechnologiesModel> favoriteTechnologies;
  final List<SkillsModel> skills;

  UserModel({
    required this.name,
    required this.description,
    required this.socialNetWork,
    required this.favoriteTechnologies,
    required this.skills,
  });
}
