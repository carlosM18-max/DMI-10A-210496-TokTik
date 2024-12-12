import 'package:flutter/material.dart';
import 'package:toktik_210496/domain/entities/video_post.dart';
import 'package:toktik_210496/infraestructure/models/local_video_model.dart';
import 'package:toktik_210496/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: respository, datasource
  
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadnextPage() async {
    // TODO: Cargar videos

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    // ver videos por medio de breaks
    initialLoading = false;
    notifyListeners();
  }
}
