import 'package:flutter/material.dart';
import 'package:icon_search/widgets/icon_viewer.dart';
import 'package:icon_search/widgets/theme_button.dart';
import 'package:url_launcher/url_launcher.dart';

class IconViewerScreen extends StatelessWidget {
  final String applicationName = 'IconSearch';
  final String applicationVersion = '0.1.0';
  const IconViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(applicationName),
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
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Text(applicationName),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Material Icons'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationName: applicationName,
                  applicationVersion: applicationVersion,
                  applicationIcon: Image.asset(
                    'assets/image/logo.png',
                    width: 60,
                  ),
                  children: [
                    InkWell(
                      child: const Text('https://inforgra.com/ja/IconSearch'),
                      onTap: () => launchUrl(Uri(scheme: 'https', host: 'inforgra.com', path: 'ja/IconSearch')),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: const IconViewer(),
    );
  }
}
