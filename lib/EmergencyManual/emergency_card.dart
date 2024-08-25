import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class EmergencyCard extends StatelessWidget {
  final String body;
  final String heading;
  
  EmergencyCard({super.key, required this.body, this.heading = ''});
  
  final MarkdownStyleSheet _style = MarkdownStyleSheet(
        textAlign: WrapAlignment.start,
        h1Align: WrapAlignment.start,
        unorderedListAlign: WrapAlignment.start
  );

  @override
  Widget build(context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.blue,width: 10))
        ),
        child: ListTile(
          title: Text(heading),
          subtitle: MarkdownBody(
            data: body,
            onTapLink: (text,href,title) {
              context.pushNamed('emergencypage',pathParameters: {'pageTitle': href as String});
            },
            styleSheet: _style,
          ),
        )
      ),
    );
  }
}