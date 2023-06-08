import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; // first player is  oh

  List<String> displayexoh = ['','','','','','','','','',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context ,int index){
            return GestureDetector(
              onTap: (){
                _tapped(index);
            },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700 )
                ),
              child: Center(child: Text(displayexoh[index],
                style: TextStyle(color: Colors.white,fontSize: 40),)),
              ),
            );
          },
      ),
    );
  }
  void _tapped(int index){
    setState(() {
     if(ohTurn && displayexoh[index] == '') {
       displayexoh[index] = 'o';
     }
     else if (!ohTurn && displayexoh[index] == ''){
       displayexoh[index]='x';
      }
 ohTurn = !ohTurn;
     _checkwinner();
    });

  }
  void _checkwinner(){
    if(displayexoh[0] == displayexoh[1] && displayexoh[0] == displayexoh[2] && displayexoh[0] != ''){
      _showwinDialog(displayexoh[0]);
    };
    if(displayexoh[3] == displayexoh[4] && displayexoh[3] == displayexoh[5] && displayexoh[3] != ''){
      _showwinDialog(displayexoh[3]);
    };
    if(displayexoh[6] == displayexoh[7] && displayexoh[6] == displayexoh[8] && displayexoh[6] != ''){
      _showwinDialog(displayexoh[6]);
    };
    if(displayexoh[0] == displayexoh[3] && displayexoh[0] == displayexoh[6] && displayexoh[0] != ''){
      _showwinDialog(displayexoh[0]);
    };
    if(displayexoh[1] == displayexoh[4] && displayexoh[1] == displayexoh[7] && displayexoh[1] != ''){
      _showwinDialog(displayexoh[1]);
    };
    if(displayexoh[2] == displayexoh[5] && displayexoh[2] == displayexoh[8] && displayexoh[2] != ''){
      _showwinDialog(displayexoh[2]);
    };
    if(displayexoh[0] == displayexoh[4] && displayexoh[0] == displayexoh[8] && displayexoh[0] != ''){
      _showwinDialog(displayexoh[0]);
    };
    if(displayexoh[2] == displayexoh[4] && displayexoh[2] == displayexoh[6] && displayexoh[2] != ''){
      _showwinDialog(displayexoh[2]);
    };
  }
  void _showwinDialog(String winner){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('WINNER is: ' + winner),
      );
        });
  }
}

