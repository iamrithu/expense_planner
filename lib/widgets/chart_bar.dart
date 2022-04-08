import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPctofTotal;

  const ChartBar(
      {Key? key,
      required this.lable,
      required this.spendingAmount,
      required this.spendingPctofTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        SizedBox(
            height: 20,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(height: 4),
        SizedBox(
          height: 80,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctofTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ]),
        ),
        const SizedBox(height: 4),
        Text(lable)
      ],
    );
  }
}
