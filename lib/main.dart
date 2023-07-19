import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BMI Calcualtor',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('My BMI Calculator'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI Calculator ',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Weight(in Kgs)'),
                        prefixIcon: Icon(Icons.line_weight)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height (in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                      controller: inController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Height (in Inch)'),
                          prefixIcon: Icon(Icons.height))),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != '' && ft != '' && inch != '') {
                          //BMI calculation
                          var iWt =
                              int.parse(wt.replaceAll(RegExp(r'[^0-9]'), ''));

                          var iFit =
                              int.parse(ft.replaceAll(RegExp(r'[^0-9]'), ''));
                          var iIch =
                              int.parse(inch.replaceAll(RegExp(r'[^0-9]'), ''));
                          var totalInch = (iFit * 12) + iIch;
                          var tCm = totalInch * 2.54;
                          var tM = tCm / 100;
                          var bmi = iWt / (tM * tM);

                          var msg = '';
                          if (bmi > 25) {
                            msg = "You are overWeight!!";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = 'Your are UnderWeight!!';
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "Congrats!! Your are Fit";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                '$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}';
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!!!";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(height: 15),
                  Text(
                    result,
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
