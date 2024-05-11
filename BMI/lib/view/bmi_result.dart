import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;
  final int height;
  final int weight;
  final String status;

  final String range;
  const BmiResultScreen({
    super.key,
    required this.result,
    required this.isMale,
    required this.age,
    required this.height,
    required this.weight,
    required this.status,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15, bottom: 15, left: 15),
              child: CustomText(
                color: Colors.black,
                text: "Result",
                fontSize: 25,
              ),
            ),
            const Center(
              child: CustomText(
                color: Colors.black,
                text: "Your BMI iS",
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: '$result',
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      const CustomText(
                        text: 'kg/m2 ',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              '($status)',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          isMale
                              ? FontAwesomeIcons.person
                              : FontAwesomeIcons.personDress,
                          size: 30,
                          // color: Colors.purple,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          isMale ? "Male" : "Female",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$age',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Age',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "$height",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Height',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "$weight",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Weight',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child:
                      RichWidget(result: result, status: status, range: range)),
            ),
            const Spacer(),
            const CustomButton(
              icon: (Icons.refresh_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class RichWidget extends StatelessWidget {
  const RichWidget({
    super.key,
    required this.result,
    required this.status,
    required this.range,
  });
  final int result;
  final String status;
  final String range;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(height: 2),
        children: [
          const TextSpan(
              text: 'A BMI of  ',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          TextSpan(
              text: '$result',
              style: const TextStyle(color: Colors.blue, fontSize: 18)),
          const TextSpan(
            text: ' indicates that your weight is in the ',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          TextSpan(
              text: status,
              style: const TextStyle(color: Colors.blue, fontSize: 18)),
          const TextSpan(
            text: ' for person in your height',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          const TextSpan(
            text: " A BMI between",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          TextSpan(
              text: (range),
              style: const TextStyle(color: Colors.blue, fontSize: 18)),
          const TextSpan(
            text:
                " falls within the normal weight range Individuals within this range typically ",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
