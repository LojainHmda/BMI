import 'package:flutter/material.dart';
import 'package:projec_1/Screens/result_page.dart';
import '../widgets/commen_age_weight.dart';
import '/widgets/gender_widget.dart';
import '/widgets/height_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  GenderType _selectedgenderType = GenderType.female;
   int height =120;
   int weight=50 ;
    int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
          ),
          title: const Text(
            "BMI Calculater",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GendgerButton(
                            genderType: GenderType.female,
                            onTap: () {
                              setState(() {
                                _selectedgenderType = GenderType.female;
                              });
                            },
                            chosengender:
                                _selectedgenderType == GenderType.female,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GendgerButton(
                            genderType: GenderType.male,
                            onTap: () {
                              setState(() {
                                _selectedgenderType = GenderType.male;
                              });
                            },
                            chosengender:
                                _selectedgenderType == GenderType.male,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    HeightWidget(
                      onChange: (newvalue) {
                        height = newvalue;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonDetails(
                            onChange: (newvalue) {
                              age = newvalue;
                            },
                            detailtype: Details.age ,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                          Expanded(
                          child: CommonDetails(
                            onChange: (newvalue) {
                              weight = newvalue;
                            },
                            detailtype: Details.weight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: MaterialButton(
                  onPressed: () {
                    
                    final double result = _calculateBMI();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ResultScreen(
                      result: result,
                    ) ));
                  
                  },
                  color: Colors.redAccent,
                  child: const SafeArea(
                    top: false,
                    child: Text(
                      "Calculate your BMI",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            )
            
         
         
          ],
        ));
  }

  double _calculateBMI() {
    final double heightInMeters = height / 100.0;         

    final double bmi = weight / (heightInMeters * heightInMeters);
    print(bmi);
    return bmi;
  }
}
