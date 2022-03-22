import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//////////////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
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

// 1- BubbleSort //

/*
 * Algorithm:-
 *
 * 1- I need to give value to the newArray which it a list of integers from the input field by using this built-in method
 * json.decode(source)
 *
 * 2-  I will make an instance from the Stopwatch to start counting the time execution for the method
 *  to know the sorting time will take it.
 *
 * 3- we need to make a loop over the arr starting from the index (0) i = 0
 *
 * 4- we need to make a loop (nested) over the arr starting from the index (1) j = 1
 *
 * 5- I need to declare a boolean variable called swapped and give it false value
 *
 * 6- we need to make a comparison between two values
 *
 * 7- the condition will be if the second element smaller than the first one we need to make some steps:-
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
 *
 * 8- This process will coming over and over again even the array will be sorted in ascending order.
 *
 * 8- I will check if the swapped process not happened i will break the function
 *
 * 9- I will declare a variable called stop with value contain the time execution which i take it from
 * from the instance i declare it at the first of function (stopwatch1)
 *
 * 10- after this I will create setState method that will assign the value for the (stop variable) to the (bubble variable).
 *  Then I will show the result inside the container
 */
  void bubbleSort(arr) {
    newArray = List<int>.from(json.decode(arr));
    //print('undOrder bubble $newArray');
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
    //print('Order bubble $newArray');
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  /* InsertionSort */

  /* Algorithm:-
  *
  * 1- at the first, I need to give value to the newArray which it a list of integers from the input field by using this built-in  * method json.decode(source)
  *
  * 2- I will make an instance from the Stopwatch to start counting the time execution for the method
  *  to know the sorting time will take it.
  *
  * 3- I need to make a loop over the arr starting from index 1
  *
  * 4- I need to declare two variables currentElement and j and assign the currentElement to the current element in the array,     * assign the index to the previous element to the j
  *
  * 5- make a while loop that will check if the j more than or equal zero and newArray[j] > currentElement
  *
  * 6- if the condition was true make a shift between the two element
  *
  * 7- decrease the value for the j variable
  *
  * 8- outside the while loop i will make a swap newArray[j + 1] = currentElement;
  *
  * 9- I will declare a variable called stop with value contain the time execution which i take it from
 * from the instance i declare it at the first of function (stopwatch2)
 *
 * 10- after this I will create setState method that will assign the value for the (stop variable) to the (bubble variable).
 *  Then I will show the result inside the container
 */

  void insertionSort(arr) {
    newArray = List<int>.from(json.decode(arr));
    print('undOrder insertion $newArray');
    Stopwatch stopwatch2 = Stopwatch()..start();
    for (int i = 1; i < newArray.length; i++) {
      int currentElement = newArray[i];
      int j = i - 1;
      while (j >= 0 && newArray[j] > currentElement) {
        newArray[j + 1] = newArray[j];
        j--;
      }
      newArray[j + 1] = currentElement;
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
            appBar: AppBar(title: const Text("Sorting Algorithms Types")),
            body: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: TextField(
                    onChanged: (text) {
                      arr = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter The List here...',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                  child: ElevatedButton(
                    child: const Text('Analyze Now'),
                    onPressed: () => {
                      //setState(() => {changeToArr()}),
                      bubbleSort(arr),
                      insertionSort(arr),
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 80,
                  child: Card(
                      child: ListTile(
                    leading: const FlutterLogo(size: 30.0),
                    title: Text(
                      'Bubble Sort:\n' + bubble.toString() + '  us',
                    ),
                  )),
                ),
                SizedBox(
                  width: 300,
                  height: 80,
                  child: Card(
                      child: ListTile(
                    leading: const FlutterLogo(size: 30.0),
                    title: Text(
                      'Insertion Sort:\n' + insertion.toString() + '  us',
                    ),
                  )),
                )
              ],
            )));
  }
}
