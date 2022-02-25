import 'package:flutter/material.dart';
import 'package:mastermind/constants.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final isSelected = <int, bool>{};
  final selectedColor = <int, Color>{};
  final isPopUpOpen = <int, bool>{};
  int? tappedTile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.05,
              crossAxisSpacing: MediaQuery.of(context).size.height * 0.05),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                if (isPopUpOpen.containsKey(index)) {
                  isPopUpOpen.remove(index);
                } else {
                  isPopUpOpen.putIfAbsent(
                    index,
                    () => isPopUpOpen[index] = true,
                  );
                }
                tappedTile = index;
              });
            },
            onLongPress: () {
              setState(() {
                isSelected.containsKey(tappedTile)
                    ? {
                        isSelected.remove(tappedTile),
                        selectedColor.update(tappedTile!, (color) {
                          return selectedColor[tappedTile!] =
                              const Color(0xFFFFFFFF);
                        })
                      }
                    : null;
              });
            },
            child: DecoratedBox(
              key: Key('decoratedBox_$index'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedColor[index],
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
            ),
          ),
          itemCount: 20,
        ),
        isPopUpOpen.containsKey(tappedTile)
            ? Center(
                child: DecoratedBox(
                  key: Key('popUpBox_$tappedTile'),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected.containsKey(tappedTile)) {
                                    isSelected.remove(tappedTile);
                                  } else {
                                    isSelected.putIfAbsent(
                                      tappedTile!,
                                      () => isSelected[tappedTile!] = true,
                                    );
                                  }

                                  selectedColor.update(tappedTile!, (color) {
                                    isPopUpOpen.remove(tappedTile);
                                    return selectedColor[tappedTile!] =
                                        colorList[index];
                                  }, ifAbsent: () {
                                    isPopUpOpen.remove(tappedTile);
                                    return selectedColor[tappedTile!] =
                                        colorList[index];
                                  });
                                });
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorList[index],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
