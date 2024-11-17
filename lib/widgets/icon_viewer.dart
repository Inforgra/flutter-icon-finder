import 'package:flutter/material.dart';
import 'package:flutter_icons/contants/material_icons.dart';
import 'package:flutter_icons/contants/material_icons_outlined.dart';
import 'package:flutter_icons/contants/material_icons_rounded.dart';
import 'package:flutter_icons/contants/material_icons_sharp.dart';
import 'package:flutter_icons/widgets/icon_list.dart';

class IconViewer extends StatefulWidget {
  const IconViewer({super.key});

  @override
  State<StatefulWidget> createState() {
    return IconViewerState();
  }
}

enum IconType { base, outlined, rounded, sharp }

class IconViewerState extends State<IconViewer> {
  var currentKeyword = '';
  var currentIconType = IconType.base;
  var currentIcons = materialIconsDefault;
  final TextEditingController _textEditingController = TextEditingController();

  void setKeyword() {
    var text = _textEditingController.text;
    setState(() {
      currentKeyword = text;
    });
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(setKeyword);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  _textEditingController.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SegmentedButton<IconType>(
          segments: const [
            ButtonSegment(
              value: IconType.base,
              label: Text('default'),
              icon: Icon(Icons.radio_button_unchecked),
            ),
            ButtonSegment(
              value: IconType.outlined,
              label: Text('outlined'),
              icon: Icon(Icons.radio_button_unchecked),
            ),
            ButtonSegment(
              value: IconType.rounded,
              label: Text('rounded'),
              icon: Icon(Icons.radio_button_unchecked),
            ),
            ButtonSegment(
              value: IconType.sharp,
              label: Text('sharp'),
              icon: Icon(Icons.radio_button_unchecked),
            ),
          ],
          selected: <IconType>{currentIconType},
          onSelectionChanged: (iconType) {
            setState(() {
              currentIconType = iconType.first;
              switch (currentIconType) {
                case IconType.base:
                  currentIcons = materialIconsDefault;
                  break;
                case IconType.outlined:
                  currentIcons = materialIconsOutlined;
                  break;
                case IconType.rounded:
                  currentIcons = materialIconsRounded;
                  break;
                case IconType.sharp:
                  currentIcons = materialIconSharp;
                  break;
              }
            });
          },
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: IconList(
            icons: currentIcons,
            keyword: currentKeyword,
          ),
        ),
      ],
    );
  }
}
