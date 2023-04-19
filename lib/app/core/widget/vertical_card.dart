import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

class VerticalCard extends StatelessWidget {
  final int index;
  final String name;
  final String image;

  const VerticalCard(
      {Key? key, required this.index, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Container(
        width: Get.width * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3fc8c8c8),
              blurRadius: 16,
              offset: Offset(0, 5),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Container(
            //   height: 135,
            //   decoration: BoxDecoration(
            //     borderRadius: const BorderRadius.only(
            //       topLeft: Radius.circular(15),
            //       topRight: Radius.circular(15),
            //     ),
            //     image: DecorationImage(
            //       image: Chaced(image),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            CachedNetworkImage(
              imageUrl: image,
              height: 135,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      name,
                      maxLines: 1,
                      style: const TextStyle(
                        color: AppColors.textSubtitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
