import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final isSelected = <int, bool>{};

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.refresh_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.help_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: GridView.builder(
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
              key: Key('$index'),
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
          itemCount: 32,
        ),
      ),
    );
  }
}
