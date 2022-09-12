import 'package:flutter/material.dart';

class ItemNew extends StatelessWidget {
  dynamic article;

  ItemNew(this.article);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
