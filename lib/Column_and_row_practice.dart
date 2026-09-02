
import 'package:flutter/material.dart';

class ColumnAndRowPractice extends StatefulWidget {
  const ColumnAndRowPractice({super.key});

  @override
  State<ColumnAndRowPractice> createState() => _ColumnAndRowPracticeState();
}

class _ColumnAndRowPracticeState extends State<ColumnAndRowPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Text('Header'),

          SizedBox(
            height: 34,
          ),

          Row(


            children: [

                  Icon(Icons.star), Icon(Icons.star), Icon(Icons.javascript_sharp),



            ],

          ),
          SizedBox(
            height: 34,
          ),
          Title(color: Colors.blue, child: Text('Footer')),
        ],
      ) ,
    );
  }
}
