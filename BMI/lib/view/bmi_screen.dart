import 'package:bmi/view/bmi_result.dart';
import 'package:bmi/widgets/Container_male.dart';
import 'package:bmi/widgets/widget_female.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int _height = 150;
  int weight = 40;
  int age = 20;
  bool isMale = true;
  late String status ;
  late String range;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Gender",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: ContainerMale(
                        text: "Male",
                          isMale: isMale,
                        icon: FontAwesomeIcons.person,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: ContainerFemale(
                          text: "Female",
                          isMale: isMale,
                        icon:FontAwesomeIcons.personDress ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "Height (cm) ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                          _height.toString(),
                          style: const TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w900),
                        ),
                            const SizedBox(
                          width: 5,
                        ),
                          const Text(
                        "cm",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                   ),
                       SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2,
                            inactiveTrackColor: Colors.white,
                            activeTrackColor: Colors.blue,
                            thumbColor: Colors.blue,
                            overlayColor: Colors.black,
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                            ),
                            child: Slider(
                              max: 220,
                              min: 120,
                              onChanged: (double newValue) {
                                setState(() {
                                  _height = newValue.toInt().round();
                                });
                            },
                            value: _height.toDouble(),
                          ),
                        )
                  ],
                ),
            ),
          )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                 children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400]),
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                shape: const CircleBorder(eccentricity: 1),
                                backgroundColor: Colors.blue,
                                onPressed: () {

                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: "age__",
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "$age",
                                style: const TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.w900),
                              ),
                              FloatingActionButton(
                                shape: const CircleBorder(eccentricity: 1),
                                backgroundColor: Colors.blue,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: "age++",
                                mini: true,
                                child: const Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                  width: 10.0,
                 ),
                  Expanded(
                    child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                     height: 110,
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        const Text(
                          "weight",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            FloatingActionButton(
                              shape: const CircleBorder(eccentricity: 1),
                              backgroundColor: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: "weight__",
                              mini: true,
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$weight",
                              style: const TextStyle(
                                  fontSize: 45, fontWeight: FontWeight.w900),
                            ),
                            // const SizedBox(
                            //   width: 5,
                            //),
                            FloatingActionButton(
                              shape: const CircleBorder(eccentricity: 1),
                              backgroundColor: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: "weight++",
                              mini: true,
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: MaterialButton(
              onPressed: () {
                double result = weight / (_height / 100 * _height / 100);
               // print(result.round());
                if (result.round()<18){
                  status = "Under Weight";
                  range=" Smaller than 18.5 ";
                }else if (result.round() >18 &&result.round()< 25 ){
                  status = "Normal Weight";
                  range=" 18.5 - 25";
                }else if (result.round() >25 &&result.round()< 30 ){
                  status = "Over Weight";
                  range=" 25 - 30";
                }else {
                  status = "Obese";
                  range=" getter than 30";
                }
               Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  BmiResultScreen(
                    isMale:isMale,
                    age:age ,
                    result:result.round(),
                    height: _height,
                    weight: weight,
                    status: status,
                    range: range,

                  );
                }));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              minWidth: double.infinity,
              height: 55,
              color: Colors.blue,
              child: const Text(
                "CALCULATE BMI",
                style: TextStyle(
                  color: Colors.white,fontSize: 20
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
