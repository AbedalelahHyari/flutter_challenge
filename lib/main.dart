import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
/* findBubbleSort */
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
  bubbleSort(List arr) {
    for (var i = 0; i < arr.length; i++) {
      for (var j = 1; j < arr.length; j++) {
        if (arr[j] < arr[j - 1]) {
          var temporary = arr[j];
          arr[j] = arr[j - 1];
          arr[j - 1] = temporary;
        }
      }
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Sorting Algorithms Types")),
            body: Column(
              children: <Widget>[],
            )));
  }
}
