import 'package:flutter/material.dart';
import 'package:mastermind/widgets/confirm_button.dart';

class HintBoard extends StatelessWidget {
  const HintBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (colNum) => 0 == colNum
            ? const ConfirmButton()
            : Row(
                key: Key('row_$colNum'),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width * 0.3,
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
                          height: 20,
                          width: 20,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
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
