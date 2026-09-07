import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_totorial_with_example/dropdown_model.dart';
import 'package:http/http.dart' as http;

class DropDownApi extends StatefulWidget {
  const DropDownApi({super.key});

  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {
  Future<List<DropDownModel>> getPost() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = json.decode(response.body) as List;

      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return DropDownModel(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No internet');
    }
    throw Exception('Error fetching');
  }
var selectvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DownDropApi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<List<DropDownModel>>(
              future: getPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: DropdownButton(
                      hint: const Text('Select value'),
                      isExpanded: true,

                      items: snapshot.data!.map((e) {
                        return DropdownMenuItem(

                          value: e.id.toString(),
                          child: Text(e.id.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                      selectvalue = value;
                      setState(() {

                      });
                      },
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}