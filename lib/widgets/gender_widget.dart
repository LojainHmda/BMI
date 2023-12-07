import 'package:flutter/material.dart';

enum GenderType { female, male }

class GendgerButton extends StatelessWidget {
   final GenderType genderType;
  final bool chosengender;
  final VoidCallback onTap;
  
  const GendgerButton(
      {super.key,
      required this.genderType,
      required this.chosengender,
      required this.onTap});
 

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(  
            color: const Color(0xff2C3355),
          border: Border.all(
            color: chosengender? Colors.white :Colors.transparent ,
            width: 2
          ),
        ),
        child:InkWell( onTap:onTap,
        child:Column(children: [
          Icon(genderType == GenderType.female ? Icons.female : Icons.male,
              color: chosengender == true ? Colors.white : Colors.grey,
              size: 40),
          const SizedBox(
            height: 20,
          ),
          Text(
            genderType == GenderType.female ? "female" : "male",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: chosengender == true ? Colors.white : Colors.grey),
          ),
        ]
        
        ))
        );
  }
}
