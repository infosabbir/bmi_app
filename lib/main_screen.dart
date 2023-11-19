import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'data_container.dart';

const activeColor = Color(0xff0073dd);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 20;
  int age = 25;
  String result = "";
  String resultDetail = "Result here";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  /* String getInterpretation(double bmi) {
    if (bmi >= 25.0) {
      return 'You have higher than normal body weight. Try to excersie more.';
    } 
    else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } 
    else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: maleBoxColor,
                    childwidget:
                        const DataContainer(icon: Icons.male, title: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: ContainerBox(
                    boxColor: femaleBoxColor,
                    childwidget: const DataContainer(
                        icon: Icons.female, title: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: SingleChildScrollView(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'HEIGHT',
                          style: textStyle1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: textStyle2,
                            ),
                            const Text(
                              'cm',
                              style: textStyle1,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: activeColor,
                          inactiveColor: inActiveColor,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerBox(
                    boxColor: inActiveColor,
                    childwidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: textStyle1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: textStyle2,
                              ),
                              const Text(
                                'kg',
                                style: textStyle1,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerBox(
                    boxColor: inActiveColor,
                    childwidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: textStyle1,
                          ),
                          Text(
                            age.toString(),
                            style: textStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age < 100) {
                                      age++;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Developed with ❤ by Rahima Bagum',
                    style: textStyle1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {},
                        backgroundColor: inActiveColor,
                        child: const Icon(Icons.portrait, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          // launch('https://github.com/swapnilsparsh');
                        },
                        backgroundColor: inActiveColor,
                        child: const Icon(FontAwesomeIcons.github,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          // launch(
                          //     'https://www.linkedin.com/in/swapnil-srivastava-sparsh/');
                        },
                        backgroundColor: inActiveColor,
                        child: const Icon(FontAwesomeIcons.linkedin,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          //launch('https://twitter.com/swapnilsparsh');
                        },
                        backgroundColor: inActiveColor,
                        child: const Icon(Icons.message, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  /*resultDetail = getInterpretation(bmi);*/
                  showDialog(
                      context: context,
                      builder: (BuildContext contest) {
                        return Dialog(
                            backgroundColor: inActiveColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              color: inActiveColor,
                              height: 200.0,
                              margin: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Your BMI',
                                    style: textStyle1,
                                  ),
                                  Text(
                                    result.toString(),
                                    style: textStyle2,
                                  ),
                                  /*Text(
                                    resultDetail,
                                    style: textStyle1,
                                  ),*/
                                ],
                              ),
                            ));
                      });
                });
              },
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: textStyle3,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
