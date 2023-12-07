import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String category = "Normal", statment = "";
  Color categorycolor = Colors.black;
  double limit1 = 0, limit2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Your Result",
        )),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color(0xff2C3355),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.result.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      selectRange(widget.result),
                      style: TextStyle(
                          color: categorycolor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "$category IBM Range:",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$limit1 - $limit2 kg/m2",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      statment,
                      style: const TextStyle(color: Colors.white),
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  String selectRange(double result) {
    if (result >= 30) {
      category = "Obesity";
      if (result >= 30 && result <= 35) {
        categorycolor = Colors.pink;
        limit1 = 30;
        limit2 = 35;
      }
      if (result >= 35 && result <= 40) {
        categorycolor = Colors.red;
        limit1 = 35;
        limit2 = 40;
      }
      if (result >= 40) {
        categorycolor = Colors.brown;
        limit1 = 40;
        limit2 = 50;
      }
      statment = " you should stop eating";
    } else if (result >= 25 && result <= 30) {
      category = "OverWeight";
      categorycolor = Colors.amber;
      limit1 = 25;
      limit2 = 30;
      statment = " you should stop eating  !";
    } else if (result >= 18.5 && result <= 25) {
      category = "Normal";
      limit1 = 18.5;
      limit2 = 25;
      categorycolor = Colors.green;
      statment = " good jop";
    } else if (result <= 18.5) {
      category = "underWeight";
      statment = " you should eat more!";

      if (result >= 17 && result <= 18.5) {
        categorycolor = Colors.amber;
        limit2 = 18.5;
        limit1 = 17;
      } else if (result >= 16 && result <= 17) {
        categorycolor = Colors.pink;
        limit2 = 17;
        limit1 = 16;
      } else {
        categorycolor = Colors.brown;
        limit2 = 15;
        limit1 = 0;
      }
    }

    return category;
  }
}
