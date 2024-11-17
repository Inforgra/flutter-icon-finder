import 'package:flutter/material.dart';
import 'package:flutter_icons/widgets/icon_viewer.dart';
import 'package:flutter_icons/widgets/theme_button.dart';


class IconViewerScreen extends StatelessWidget {
  final String title;
  const IconViewerScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: const [
          ThemeButton(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Material Icons'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: const IconViewer(),
    );
  }
}
