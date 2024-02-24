import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 1;
  String imgname = 'brush';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      body: Center(
        child: GestureDetector(
          onTap: (){
            final randnumber = Random().nextInt(9);
            setState(() {
              number = randnumber + 1;
              switch(number)
              {
                case 9:
                  imgname = 'delete';
                  break;
                case 8:
                  imgname = 'color';
                  break;
                case 7:
                  imgname = 'edit';
                  break;
                case 6:
                  imgname = 'erase';
                  break;
                case 5:
                  imgname = 'pencil';
                  break;
                case 4:
                  imgname = 'paint-bucket';
                  break;
                case 3:
                  imgname = 'paint';
                  break;
                case 3:
                  imgname = 'undo';
                  break;
                default :
                  imgname = 'brush';
              }
              print(number);
            });

          },
          child: Image.asset(
              'asset/images/$imgname.png'
          ),
        ),

      )
    );
  }
}
