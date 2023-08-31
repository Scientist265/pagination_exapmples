import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_api_service.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  // Pagination
  int _page = 0;
  final int _limit = 20;
 
  

  final userApi = UserApi();
  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  // List? quizs;
  // fetchQuiz() async {
  //   const url = 'https://pathed.onrender.com/api/v1/quiz/1';
  //   final response = await http.get(Uri.parse(url));
  //   final body = response.body;
  //   final json = jsonDecode(body) as Map;
  //   final result = json['quiz'] as List<dynamic>;
  //   if (response.statusCode == 200) {
  //     print('Good');
  //   } else {
  //     print('something is wrong');
  //   }

  //   setState(() {
  //     final quizs = result;
  //     print(quizs);
  //   });
  // }

  @override
  void initState() {
    fetchUsers();
    // fetchQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Api Calling',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            final color =
                user.gender == 'male' ? Colors.blue : Colors.amberAccent;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(user.fullName),
                subtitle: Text(user.loc.country),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.pic.large)),

                // subtitle: Text(users.ema),
                // leading: ClipRRect(
                //     borderRadius: BorderRadius.circular(30),
                //     child: Image.network(users[index]['picture']['large'])),
              ),
            );
          }),
    );
  }
}
