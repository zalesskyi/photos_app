import 'package:equatable/equatable.dart';
import 'package:retrofit/retrofit.dart';

class MediaResponse extends Equatable {

  String userId;
  String id;
  String title;

  MediaResponse(this.userId, this.id, this.title);

  @override
  List<Object> get props => [userId, id, title];

  factory MediaResponse.fromJson(Map<String, dynamic> json) {
    return MediaResponse(json["userId"].toString(), json["id"].toString(), json["title"].toString());
  }
}