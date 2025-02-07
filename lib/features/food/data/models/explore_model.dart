 
import '../../domain/entities/exploreitem.dart';

class ExploreModel extends ExploreItem {
  ExploreModel({required String id, required String title})
      : super(id: id, title: title);

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title};
  }
}
