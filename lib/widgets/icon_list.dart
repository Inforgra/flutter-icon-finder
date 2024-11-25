import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconList extends StatelessWidget {
  final Map<String, IconData> icons;
  final String keyword;

  const IconList({super.key, required this.icons, required this.keyword});

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
                  Expanded(
                      child: FittedBox(
                          child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet((context) {
                        return TapRegion(
                          onTapOutside: (_) => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 200.0,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                              text: 'Icon(Icons.${icon.key})'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text('Copied')));
                                        },
                                        icon: const Icon(Icons.content_copy),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 100.0,
                                          child: FittedBox(
                                              child: Icon(icon.value))),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    icon: Icon(icon.value),
                  ))),
                  SizedBox(height: 32, child: Text(icon.key)),
                ],
              ))
          .toList(),
    );
  }
}
