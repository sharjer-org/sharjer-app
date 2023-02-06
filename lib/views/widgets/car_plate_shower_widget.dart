import 'package:flutter/material.dart';

class CarPlateShower extends StatelessWidget {
  String carPlate;
  CarPlateShower({super.key, required this.carPlate});

  @override
  Widget build(BuildContext context) {
    if (carPlate.isEmpty) {
      return Container();
    }
    List<String> carPlateValues = carPlate.split("|");

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "ایـــران",
                    style: TextStyle(fontSize: 9),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    carPlateValues[0],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const VerticalDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 15,
                ),
                Text(
                  carPlateValues[1],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  carPlateValues[2],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  carPlateValues[3],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
