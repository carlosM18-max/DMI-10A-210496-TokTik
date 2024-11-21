class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json["answer"] ?? 'No se encontro el video',
    videoUrl: json["forced"],
    likes: json["image"],
    views: json["image"],
  );
}
