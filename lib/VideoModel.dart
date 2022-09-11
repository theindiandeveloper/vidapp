
class VideoModel{
  final String id;
  final String title;
  final String content;
  final String videourl;

  VideoModel(this.id, this.title, this.content, this.videourl);
  factory VideoModel.fromJson(dynamic json){
    return VideoModel(json["id"] as String, json["title"] as String, json["content"] as String, json["videourl"] as String);
  }
}