import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RemoteAsset extends StatefulWidget {
  final String imagePath;
  const RemoteAsset({
    super.key,
    required this.imagePath,
  });

  @override
  State<RemoteAsset> createState() => _RemoteAssetState();
}

class _RemoteAssetState extends State<RemoteAsset> {
  void reload() {
    setState(() {});
  }

  static final _storageRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    final imageUrl = _storageRef.child(widget.imagePath);

    final errorWidget = IconButton(
      onPressed: reload,
      icon: const Icon(Icons.replay_outlined),
    );

    const loadingWidget = Center(child: CircularProgressIndicator());

    return FutureBuilder(
      future: imageUrl.getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.error != null) {
          return errorWidget;
        }

        if (!snapshot.hasData) {
          return loadingWidget;
        }
        final url = snapshot.data ?? '';
        return CachedNetworkImage(
          cacheKey: url.isNotEmpty ? url : const Uuid().v4(),
          imageUrl: url,
          placeholder: (context, url) => loadingWidget,
          errorWidget: (context, url, error) => errorWidget,
        );
      },
    );
  }
}
