import 'package:flutter/material.dart';

class NoDataComponent extends StatelessWidget {
  const NoDataComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/nodata.png'),
            const SizedBox(
              height: 10,
            ),
            Text("No data, Please try searching for the city.")
          ],
        ),
      ),
    );
  }
}
