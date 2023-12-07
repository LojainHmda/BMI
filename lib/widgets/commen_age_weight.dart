import 'package:flutter/material.dart';

import 'common_widget.dart';

enum Details { weight, age }

class CommonDetails extends StatefulWidget {
  const CommonDetails(
      {super.key, required this.onChange, required this.detailtype});
  final void Function(int newvalue) onChange;
  final Details detailtype;
  @override
  State<CommonDetails> createState() => _CommonDetailsState();
}

class _CommonDetailsState extends State<CommonDetails> {
  static int weight = 50;
  static int age = 20;

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
          Text(
            widget.detailtype == Details.age ? "Age" : "Weight",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Text(
            widget.detailtype == Details.age
                ? "${_CommonDetailsState.age}"
                : "${_CommonDetailsState.weight}",
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() {
                    if (widget.detailtype == Details.age) {
                      _CommonDetailsState.age = _CommonDetailsState.age + 1;

                      widget.onChange(_CommonDetailsState.age);
                    } else {
                      _CommonDetailsState.weight =
                          _CommonDetailsState.weight + 1;
                      widget.onChange(_CommonDetailsState.weight);
                    }
                  });
                },
              ),
              CommonButton(
                icon: Icons.remove,
                onPressed: () {
                  setState(() {
                    if (widget.detailtype == Details.age) {
                      if (_CommonDetailsState.age < 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("You cant use negative values")));
                      } else {
                        _CommonDetailsState.age = _CommonDetailsState.age - 1;

                        widget.onChange(_CommonDetailsState.age);
                      }
                    } else {
                      if (_CommonDetailsState.weight < 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("You cant use negative values")));
                      } else {
                        _CommonDetailsState.weight =
                            _CommonDetailsState.weight - 1;
                        widget.onChange(_CommonDetailsState.weight);
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
