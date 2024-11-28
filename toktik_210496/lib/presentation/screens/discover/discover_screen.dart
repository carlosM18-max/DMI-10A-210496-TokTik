import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_210496/presentation/providers/discover_provider.dart';
import 'package:toktik_210496/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvier = context.watch<DiscoverProvider>();
    
    return Scaffold(
      // Elemento para toda la pantalla
      body: discoverProvier.initialLoading
      ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
      : VideoScrollableView(videos: discoverProvier.videos)
    );
  }
}