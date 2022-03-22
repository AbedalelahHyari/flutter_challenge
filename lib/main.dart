import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//////////////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////
class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  var arr = "";

  //late List<int> intArray;
  late List newArray2;

  changeToArr() {
    //arr = arr.replaceAll(new RegExp('[]'), '');
    newArray2 = json.decode(arr);
    //print(newArray2);
    //print(newArray2[0]);
    //var valuesArray = int.parse(arr);
    //newArray2[i]//final newArray = arr.replaceAll(new RegExp(r'[^0-9]'), '');
    //var latestVersion = List<int>.from(json.decode(arr));
    //intArray = List<int>.from(json.decode(newArray));
    //print(int.parse(newArray));
    //print('This from stackoverflow website    $latestVersion');
  }

  /*
  String get name => this.form.control('array').value;
  */
  int bubble = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

//////////////////////////////////////////////////////////////////////////////////////////
/* BubbleSort */
/*
 * Algorithm:-
 *
 * 1- we need to make a loop over the arr
 *
 * 2- we need to make another loop (nested) over the arr starting from the index 1 j = 1
 *
 * 3- we need to make a comparison between two value
 *
 * 4- the condition will be if the second element smaller than the first one we need to make some steps:-
 *
 *      a- we need to save the smaller value in a temporary variable
 *
 *      b- we need to make a swap between the two elements
 *
 *      c- reassign the value for the smaller element with the bigger one
 *
 *      d- Then we take the value that we save in the temporary variable and assign it to the bigger element
 *
 * 5- This process will coming over and over again even the array will be sorted in ascending order.
 *
 * 6- At the end i will return the arr.
 */
  bubbleSort(newArray2) {
    Stopwatch stopwatch1 = new Stopwatch()..start();
    for (var i = 0; i < newArray2.length; i++) {
      //newArray2[i] = int.parse(newArray2[i]);
      bool swapped = false;
      for (var j = 1; j < newArray2.length; j++) {
        if (newArray2[j] < newArray2[j - 1]) {
          var temporary = newArray2[j];
          newArray2[j] = newArray2[j - 1];
          newArray2[j - 1] = temporary;
          swapped = true;
        }
      }
      if (!swapped) break;
    }
    //return arr;

    int stop = stopwatch1.elapsedMicroseconds;
    setState(() {
      bubble = stop;
      print('bubble Time $bubble');
    });
    print('test array $newArray2');
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Sorting Algorithms Types")),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: TextField(
                    onChanged: (text) {
                      this.arr = text;
                      // print('array of Integers $arr');

                      //print(bubbleSort(text));
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter The List here...',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                  child: ElevatedButton(
                    child: const Text('Analyze Now'),
                    onPressed: () => {
                      //print("The Button Clicked"),
                      setState(() => {changeToArr()}),
                      bubbleSort(newArray2)
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: Card(
                      child: ListTile(
                    leading: FlutterLogo(size: 30.0),
                    title: Text(
                      'Bubble Sort:\n' + bubble.toString() + '  us',
                    ),
                  )),
                ),
              ],
            )));
  }
}
