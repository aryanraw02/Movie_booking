/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:15:32
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays an image with a shimmer loading effect.
/// - If the image is still loading, a shimmering placeholder is shown.
/// - Once loaded, the image replaces the placeholder.
class ShimmerImage extends StatelessWidget {
  /// The URL of the image to be displayed.
  final String url;

  /// Determines how the image should be fitted inside its container.
  final BoxFit fit;

  /// The width of the image when `aspectRatio` is not provided.
  final double width;

  /// The height of the image when `aspectRatio` is not provided.
  final double height;

  /// Optional aspect ratio to control the image's width-to-height ratio.
  /// - If `aspectRatio` is greater than 0, it takes priority over `width` and `height`.
  final double aspectRatio;

  /// The size of the placeholder icon when the image is loading.
  final double iconHolderSize;
  const ShimmerImage({
    super.key,
    required this.url,
    required this.fit,
    this.width = 16,
    this.height = 16,
    this.aspectRatio = 0,
    this.iconHolderSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// The shimmer effect that acts as a placeholder while the image loads.
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child:
              aspectRatio != 0
                  ? AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Container(child: _buildIcon()),
                  )
                  : SizedBox(width: width, height: height, child: _buildIcon()),
        ),

        /// The actual image fetched from the provided `url`.
        /// - Uses an `AspectRatio` if provided,
        /// otherwise it follows `width` and `height`.
        aspectRatio != 0
            ? AspectRatio(
              aspectRatio: aspectRatio,
              child: Image.network(url, fit: fit),
            )
            : Image.network(url, width: width, height: height, fit: fit),
      ],
    );
  }

  _buildIcon() {
    return Center(
      child: Icon(Icons.crop_original, color: Colors.red, size: iconHolderSize),
    );
  }
}
