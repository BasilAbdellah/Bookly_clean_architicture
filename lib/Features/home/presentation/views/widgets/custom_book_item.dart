// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/utils/assets.dart';
//
// class CustomBookImage extends StatelessWidget {
//   const CustomBookImage({Key? key, required this.image}) : super(key: key);
//  final String image;
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: AspectRatio(
//         aspectRatio: 2.6 / 4,
//         child: CachedNetworkImage(imageUrl:image,fit: BoxFit.fill, )
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl:  image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}