import 'package:flutter/material.dart';

class GuessingBoard extends StatelessWidget {
  const GuessingBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (colNum) => Row(
          key: Key('row_$colNum'),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ListView.separated(
                itemBuilder: (context, index) => DecoratedBox(
                  key: Key('cell_$colNum$index'),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: const SizedBox(
                    height: 40,
                    width: 40,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
