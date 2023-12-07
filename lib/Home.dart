import 'dart:convert';

import 'package:dailydosenews_uts/the_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _post = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons
                .pages_outlined), // Replace with the actual icon you want to use
            SizedBox(width: 8), // Add some space between the icon and the title
            Text(
              'Daily Dose of News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _post[index]['urlToImage'] != null
                  ? Image.network(
                      _post[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Center(),
            ),
            title: Text(
              '${_post[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_post[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => TheDetails(
                            url: _post[index]['url'],
                            title: _post[index]['title'],
                            content: _post[index]['content'],
                            publishedAt: _post[index]['publishedAt'],
                            author: _post[index]['author'],
                            urlToImage: _post[index]['urlToImage'],
                          )));
            },
          );
        },
      ),
    );
  }

  Future<void> _getData() async {
    try {
      final Uri apiUrl = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=2dd1d3205b2e48009e7000bb90c7f21b');
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _post = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
