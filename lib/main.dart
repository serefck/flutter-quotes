import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sozler_2/model/quotes_model.dart';
import 'package:flutter_sozler_2/service/quotes_service.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuotesService _service = QuotesService();

  List<QuotesModelResults?> quotes = [];
  var quote = "";
  var author = "";
  var onShareClick;
  var onLikeClick;
  var bgColor;

  final controller = ScreenshotController();
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _service.fetchQuotes().then((value) {
      if (value != null && value.results != null) {
        setState(() {
          quotes = value.results!;
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Love Quotes'),
          ),
          body: Stack(
            children: [
              Screenshot(
                controller: controller,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.primaries[
                              _random.nextInt(Colors.primaries.length)]
                          [_random.nextInt(9) * 100],
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Image.asset(
                            "assets/quote.png",
                            height: 30,
                            width: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            quotes[index]!.content!,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(quotes[index]!.author!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Spacer(),
                        ],
                      ),
                    );
                  },
                  itemCount: quotes.length,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final image = await controller.capture();
                        if (image == null) return;
                        await saveImage(image);
                      },
                      child: Text("Save as Image"),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }
}
