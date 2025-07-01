import 'package:flutter/material.dart';

class PostImageGrid extends StatelessWidget {
  final dynamic imgLinks;

  const PostImageGrid({Key? key, required this.imgLinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [];

    if (imgLinks is List) {
      images = List<String>.from(imgLinks);
    } else if (imgLinks is String && imgLinks.isNotEmpty) {
      images = [imgLinks];
    }

    if (images.isEmpty) return SizedBox();

    if (images.length == 1) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            images[0],
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    if (images.length == 3) {
      final double halfWidth = MediaQuery.of(context).size.width / 2;

      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(
              width: halfWidth,
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 4),
            Flexible(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: images.length > 4 ? 4 : images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          bool isLastImage = index == 3 && images.length > 4;

          return Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
              if (isLastImage)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Text(
                    '+${images.length - 4}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
