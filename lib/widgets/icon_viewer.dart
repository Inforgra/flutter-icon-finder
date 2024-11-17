import 'package:flutter/material.dart';

class IconViewer extends StatelessWidget {
  final Map<String, IconData> icons;
  final String keyword;

  const IconViewer({super.key, required this.icons, required this.keyword});

  int getCrossAxisAlignment(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width < 640) {
      return 4;
    } else if (width < 768) {
      return 4;
    } else if (width < 1024) {
      return 6;
    } else if (width < 1280) {
      return 8;
    } else if (width < 1536) {
      return 8;
    } else {
      return 8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: getCrossAxisAlignment(context),
      children: icons.entries
          .where((e) => e.key.contains(keyword))
          .map((icon) => Column(
                children: [
                  Expanded(child: FittedBox(child: Icon(icon.value))),
                  SizedBox(height: 32, child: Text(icon.key)),
                ],
              ))
          .toList(),
    );
  }
}
