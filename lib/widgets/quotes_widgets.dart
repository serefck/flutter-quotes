import 'package:flutter/material.dart';

class QuotesWidget extends StatelessWidget {
  var quote = "";
  var author = "";
  var onShareClick;
  var onLikeClick;
  var bgColor;

  QuotesWidget(this.quote, this.author, this.onLikeClick, this.onShareClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
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
            quote,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          Text(author,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Spacer(),
          InkWell(
            onTap: onLikeClick,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: onShareClick,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white)),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
