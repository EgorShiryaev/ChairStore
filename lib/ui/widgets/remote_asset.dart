import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class RemoteAsset extends StatefulWidget {
  final String imagePath;
  const RemoteAsset({
    super.key,
    required this.imagePath,
  });

  static final _storageRef = FirebaseStorage.instance.ref();

  @override
  State<RemoteAsset> createState() => _RemoteAssetState();
}

class _RemoteAssetState extends State<RemoteAsset> {
  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = RemoteAsset._storageRef.child(widget.imagePath);

    return FutureBuilder(
      future: imageUrl.getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.error != null) {
          return IconButton(
            onPressed: reload,
            icon: const Icon(Icons.replay_outlined),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Image.network(
          snapshot.data ?? '',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        );
      },
    );
  }
}
