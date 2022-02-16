import 'package:flutter/material.dart';

class Hint extends StatefulWidget {
  const Hint({Key? key, required this.correctOrder}) : super(key: key);

  final List<int> correctOrder;

  @override
  _HintState createState() => _HintState();
}

class _HintState extends State<Hint> {
  final isSelected = <int, bool>{};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: MediaQuery.of(context).size.width * 0.05,
          crossAxisSpacing: MediaQuery.of(context).size.height * 0.05),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected.containsKey(index)) {
              isSelected.remove(index);
            } else {
              isSelected.putIfAbsent(index, () => isSelected[index] = true);
            }
          });
        },
        child: Container(
          key: Key('container_$index'),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected[index] != null ? Colors.blue : null,
            border: Border.all(
              color: Colors.black,
              width: 5,
            ),
          ),
        ),
      ),
      itemCount: 16,
    );
  }
}
