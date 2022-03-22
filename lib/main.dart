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
  int bubble = 0;
  int insertion = 0;

  late List newArray;

  changeToArr() {
    newArray = List<int>.from(json.decode(arr));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

//////////////////////////////////////////////////////////////////////////////////////////
/* 1- BubbleSort */

/*
 * Algorithm:-
 *
 * 1- we need to make a loop over the arr
 *
 * 2- then I need to give value to the newArray which it a list of integers from the input field
 *
 * 3-  I will make an instance from the Stopwatch to start counting the time execution for the method
 *  to know the sorting time will take it.
 *
 * 4- we need to make another loop (nested) over the arr starting from the index 1 j = 1
 *
 * 5- I need to declare a boolean variable called swapped and give it false value
 *
 * 3- we need to make a comparison between two values
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
 *      e- I will reassign the value for the variable swapped because we make an swap process between two value in the list
 *
 * 5- This process will coming over and over again even the array will be sorted in ascending order.
 *
 * 6- I will check if the swapped process not happened i will break the function
 *
 * 7- I will declare a variable called stop with value contain the time execution which i take it from
 * from the instance i declare it at the first of function (stopwatch1)
 *
 * 8- after this I will create setState method that will assign the value for the stop variable to the bubble variable.
 *  Then I will show the result inside the container
 *
 *
 *
 */
  void bubbleSort(arr) {
    newArray = List<int>.from(json.decode(arr));
    print('undOrder bubble $newArray');
    Stopwatch stopwatch1 = Stopwatch()..start();
    for (int i = 0; i < newArray.length; i++) {
      bool swapped = false;
      for (int j = 1; j < newArray.length; j++) {
        if (newArray[j] < newArray[j - 1]) {
          var temporary = newArray[j];
          newArray[j] = newArray[j - 1];
          newArray[j - 1] = temporary;
          swapped = true;
        }
      }
      if (!swapped) break;
    }

    int stop = stopwatch1.elapsedMicroseconds;
    setState(() {
      bubble = stop;
    });
    print('Order bubble $newArray');
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  /* InsertionSort */
  void insertionSort(arr) {
    newArray = List<int>.from(json.decode(arr));
    print('undOrder insertion $newArray');
    Stopwatch stopwatch2 = Stopwatch()..start();
    for (int i = 0; i < newArray.length; i++) {
      var x = newArray[i], j = i;

      while (j > 0 && newArray[j - 1] > x) {
        newArray[j] = newArray[j - 1];
        newArray[j - 1] = x;
        j--;
      }

      newArray[j] = x;
    }
    int stop = stopwatch2.elapsedMicroseconds;
    setState(() {
      insertion = stop;
    });
    print('Order insertion $newArray');
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
                      //setState(() => {changeToArr()}),
                      bubbleSort(arr),
                      insertionSort(arr),
                    },
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
                  child: Card(
                      child: ListTile(
                    leading: FlutterLogo(size: 30.0),
                    title: Text(
                      'Bubble Sort:\n' + bubble.toString() + '  us',
                    ),
                  )),
                ),
                Container(
                  width: 300,
                  height: 80,
                  child: Card(
                      child: ListTile(
                    leading: FlutterLogo(size: 30.0),
                    title: Text(
                      'Insertion Sort:\n' + insertion.toString() + '  us',
                    ),
                  )),
                )
              ],
            )));
  }
}
