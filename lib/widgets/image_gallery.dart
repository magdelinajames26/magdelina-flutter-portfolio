// lib/widgets/image_gallery.dart

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../data_model.dart'; // Import the MediaAsset model

// Full-screen gallery viewer for certificates and activity photos.
class ImageGalleryViewer extends StatelessWidget {
  final List<MediaAsset> assets;
  final int initialIndex;
  final String title;

  const ImageGalleryViewer({
    super.key,
    required this.assets,
    required this.initialIndex,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(assets[index].imagePath),
            initialScale: PhotoViewComputedScale.contained * 0.9,
            heroAttributes: PhotoViewHeroAttributes(tag: assets[index].imagePath),
          );
        },
        itemCount: assets.length,
        loadingBuilder: (context, event) => const Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }

  // Helper function to launch the viewer
  static void show(BuildContext context, List<MediaAsset> assets, int index, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageGalleryViewer(
          assets: assets,
          initialIndex: index,
          title: title,
        ),
      ),
    );
  }
}
