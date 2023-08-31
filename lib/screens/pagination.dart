import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginationPage extends StatefulWidget {
  const PaginationPage({super.key});

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final _scrollController = ScrollController();
  bool isLoadingMoreData = false;
  List posts = [];
  int page = 1;

  // api fetching
  Future<void> fetchPost() async {
    final url =
        'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10& page= $page';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        posts = posts + jsonData;
      });
    } else {
      debugPrint('Error');
    }
  }

  void _scrollListener() async {
    if (isLoadingMoreData) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMoreData = true;
      });
      page = page + 1;
      await fetchPost();
      setState(() {
        isLoadingMoreData = false;
      });
    }
  }
  // Future<void> fetchQuiz() async {
  //   var endpoint = 'https://pathed.onrender.com/api/v1/quiz?page=1&size=3';
  //   final response = await http.get(Uri.parse(endpoint));
  //   final jsonData = jsonDecode(response.body) as Map;
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       questions = jsonData as List;
  //     });
  //     debugPrint(questions.toString());
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    fetchPost();
    _scrollController.addListener(_scrollListener);
    // fetchQuiz();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.black26,
        title: const Center(child: Text('Pagination Example')),
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: isLoadingMoreData ? posts.length + 1 : posts.length,
          itemBuilder: (_, index) {
            if (index < posts.length) {
              final post = posts[index];
              final title = post['title']['rendered'];
              final subtitle = post['excerpt']['rendered'];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('$title'),
                  subtitle: Text('$subtitle'),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white54,
                ),
              );
            }
          }),
    );
  }
}
