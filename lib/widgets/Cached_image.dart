import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CachedImge extends StatelessWidget {
  String imageUrl;
  CachedImge({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => Container(
          width: 0,
          height: 0,
          color: const Color.fromARGB(0, 244, 67, 54),
          child: const Center(
            child: Text('برای این محصول عکسی یافت نشد!'),
          ),
        ),
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
