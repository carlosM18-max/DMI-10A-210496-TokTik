import 'package:flutter/material.dart';
import 'package:toktik_210496/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadnextPage() async {
    // TODO: Cargar videos

    
    notifyListeners();
  }
}
