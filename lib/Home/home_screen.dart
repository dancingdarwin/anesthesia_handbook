import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:go_router/go_router.dart';
import '../util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _aboutString = '';

  @override
  void initState() {
    super.initState();
    getAbout();
  }

  Future<void> _dialogBuilder(BuildContext context){
    getAbout();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About this App'),
          content: Builder(
            builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.                              
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

            // ignore: sized_box_for_whitespace
            return Container(
              height: height - 90,
              width: width - 50,
              child: Markdown(
                data: _aboutString,
                onTapLink: (text, href, title) {
                  launchURL(href);
                },
              ),
            );
            },
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> getAbout() async {
    final response = await rootBundle.loadString('assets/AboutText.md');
    setState(() { 
      _aboutString = response; 
    }); 
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hopkins ACCM Companion', style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            TileButton(
              onPressed: () {context.go('/emergency');},
              icon: Icons.emergency,
              label: 'Emergency Manual',
              backgroundColor: theme.colorScheme.error,
              iconColor: theme.colorScheme.onError,
              labelColor: theme.colorScheme.onError,
            ),
            TileButton(
              onPressed: () {context.go('/calculator');},
              icon: Icons.calculate,
              label: 'Calculators',
              backgroundColor: theme.colorScheme.primary,
              iconColor: theme.colorScheme.onPrimary,
              labelColor: theme.colorScheme.onPrimary,
            ),
            TileButton(
              onPressed: () {context.go('/directory');},
              icon: Icons.phone,
              label: 'Directory',
              backgroundColor: theme.colorScheme.secondary,
              iconColor: theme.colorScheme.onSecondary,
              labelColor: theme.colorScheme.onSecondary,
            ),
            TileButton(
              onPressed: () => _dialogBuilder(context),
              icon: Icons.info,
              label: 'About',
              backgroundColor: theme.colorScheme.tertiary,
              iconColor: theme.colorScheme.onTertiary,
              labelColor: theme.colorScheme.onTertiary,
            ),
            TileButton(
              onPressed: () {launchURL('https://www.youtube.com/watch?v=uHsmJjvpKV8');},
              icon: Icons.help,
              label: 'Tutorial',
              backgroundColor: theme.colorScheme.primaryFixed,
              iconColor: theme.colorScheme.onPrimaryFixed,
              labelColor: theme.colorScheme.onPrimaryFixed,
            ),
            TileButton(
              onPressed: () {launchURL('https://forms.gle/2Dw2ExiJvVmooF9i7');},
              icon: Icons.feedback,
              label: 'Submit Feedback',
              backgroundColor: theme.colorScheme.primaryFixed,
              iconColor: theme.colorScheme.onPrimaryFixed,
              labelColor: theme.colorScheme.onPrimaryFixed,
            )
          ],
        )
      ),
    );
  }
}

