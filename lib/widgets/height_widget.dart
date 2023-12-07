import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget({super.key, required this.onChange});
  final void Function(int newvalue) onChange;

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int height = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xff2C3355),
        ),
        child: Column(
          children: [
            const Text("Height",
                style: TextStyle(fontSize: 10, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$height",
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  width: 10,
                ),
                const Text("cm",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Slider(
                value: height.toDouble(),
                max: 200,
                min: 60,
                onChanged: (newvalue) {
                  setState(() {
                    height = newvalue.toInt();
                  });
                  widget.onChange(height);
                })
          ],
        ));
  }
}
