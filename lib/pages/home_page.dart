import 'package:flutter/material.dart';
import 'package:flutter_sozler_2/widgets/quotes_widgets.dart';
import 'package:flutter_sozler_2/model/quotes_model.dart';
import 'package:flutter_sozler_2/service/quotes_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuotesService _service = QuotesService();

  List<QuotesModelResults?> quotes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        return PageView(
          children: [
            QuotesWidget(
                quotes[index]!.content!, quotes[index]!.author!, () {}, () {})
          ],
        );
      },
    ));
  }
}
