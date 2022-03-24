import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/visual.dart';

//////////////////////////////////////////////////////////////////////////////////////////

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//////////////////////////////////////////////////////////////////////////////////////////
class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();
  var arr = "";
  int bubble = 0;
  int insertion = 0;
  int selection = 0;
  int heap = 0;
  int merge = 0;
  late List newArray;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

//////////////////////////////////////////////////////////////////////////////////////////

// Bubble Sort //

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
  void bubbleSort() {
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
  // InsertionSort //

  /* Algorithm:-
  *
  * 1- at the first, I need to give value to the newArray which it a list of integers from the input field by using this built-in
  * method json.decode(source)
  *
  * 2- I will make an instance from the Stopwatch to start counting the time execution for the method
  *  to know the sorting time will take it.
  *
  * 3- I need to make a loop over the arr starting from index 1
  *
  * 4- I need to declare two variables currentElement and j and assign the currentElement to the current element in the array,
  * assign the index to the previous element to the j
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

  void insertionSort() {
    newArray = List<int>.from(json.decode(arr));
    //print('undOrder insertion $newArray');
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
    //print('Order insertion $newArray');
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  // Selection Sort //
  /*
  * Algorithm:-
  *
  * 1- at the first, I need to give value to the newArray which it a list of integers from the input field by using this built-in
  *    method json.decode(source)
  * 2- I initialize two variables minElement and temp
  *
  * 3- I will make an instance from the Stopwatch to start counting the time execution for the method
  *  to know the sorting time will take it.
  *
  * 4- I need to make a loop over the list starting from index 0
  *
  * 5- I will assign value i to the minElement
  *
  * 6- I will make another loop to starting from index 1
  *
  * 7- I will compare if the current element less than of the element which I assumed its the minElement I will reassign the minElement
  *  with the index of that element that will match the condition
  *
  * 8- I will store the minElement in the temp variable
  *
  * 9- I will make a swap process between the two elements
  *
  * 10- I will declare a variable called stop with value contain the time execution which i take it from
  *    from the instance i declare it at the first of function (stopwatch3)
  *
  * 11- after this I will create setState method that will assign the value for the (stop variable) to the (bubble variable).
  *     Then I will show the result inside the container
 */

  void selectionSort() {
    newArray = List<int>.from(json.decode(arr));
    int minElement;
    int temp;
    //print('undOrder selection $newArray');
    Stopwatch stopwatch3 = Stopwatch()..start();
    for (int i = 0; i < newArray.length; i++) {
      minElement = i;
      for (int j = i + 1; j < newArray.length; j++) {
        if (newArray[j] < newArray[minElement]) {
          minElement = j;
          temp = newArray[minElement];
          newArray[minElement] = newArray[i];
          newArray[i] = temp;
        }
      }
    }
    int stop = stopwatch3.elapsedMicroseconds;
    setState(() {
      selection = stop;
    });
    //print('Order Selection $newArray');
  }

  //////////////////////////////////////////////////////////////////////////////////

  //Heap Sort//
/*
*                                     /*Heap will represent based on Complete Binary Tree*/
* There is two type of heap sorting:-
* 1- Max Heap: The Parent node will be more than or equal the children
* 2- Min Heap: The Parent node will be less than or equal the children
* Note:- To consider the complete binary tree its a Heap its needs to be min or max heap(One of them).
*/
  /*
  * Algorithm:-
  * 1- First I need to declare a function called heapify that will take a three parameter array,n,i.
  * 2- Then I will assumed i its the largest element.
  * 3- I will declare the left variable.
  * 4- I will declare the right variable.
  * 5- I make a condition that will check if the left is smaller than the array length and the left-side is bigger than the largest element then
  * I will make an exchange between them.
  * 6- I make a condition that will check if the right is smaller than the array length and the right-side is bigger than the largest element
  * then I will make an exchange between them.
  * 7- I will make condition to check if the largest element no equal the index which assumed as the largest element if the condition true
  * I will make swap process and re-call(recursive) the heapify function
  */
  void heapify(List newArray, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && newArray[l] > newArray[largest]) {
      largest = l;
    }

    if (r < n && newArray[r] > newArray[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(newArray, i, largest);
      heapify(newArray, n, largest);
    }
  }

  void swapList(List newArray, int i, int largest) {
    int swap = newArray[i];
    newArray[i] = newArray[largest];
    newArray[largest] = swap;
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  void heapSort() {
    Stopwatch stopwatch4 = Stopwatch()..start();
    newArray = List<int>.from(json.decode(arr));
    //print('undOrder heap $newArray');

    int n = newArray.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      heapify(newArray, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      swap(newArray, i);
      heapify(newArray, i, 0);
    }
    int stop = stopwatch4.elapsedMicroseconds;
    setState(() {
      heap = stop;
    });
    //print('Order heap $newArray');
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Sorting Algorithms Types")),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: TextField(
                onChanged: (text) {
                  arr = text;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add The array here=>  [3,2,1,0]',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: ElevatedButton(
                child: const Text('Analyze Now'),
                onPressed: () => {
                  bubbleSort(),
                  insertionSort(),
                  selectionSort(),
                  heapSort(),
                },
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: Card(
                color: Colors.blueGrey,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: ListTile(
                  leading: const FlutterLogo(size: 30.0),
                  title: Text(
                    'Bubble Sort:\n' + bubble.toString() + '  us',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: Card(
                color: Colors.blueGrey,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: ListTile(
                  leading: const FlutterLogo(size: 30.0),
                  title: Text(
                    'Insertion Sort:\n' + insertion.toString() + '  us',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: Card(
                color: Colors.blueGrey,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: ListTile(
                  leading: const FlutterLogo(size: 30.0),
                  title: Text(
                    'Selection Sort:\n' + selection.toString() + '  us',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: Card(
                color: Colors.blueGrey,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: ListTile(
                  leading: const FlutterLogo(size: 30.0),
                  title: Text(
                    'Heap Sort:\n' + heap.toString() + '  us',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Visualization Section'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Visual()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
