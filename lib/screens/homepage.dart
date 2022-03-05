import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';
import 'package:mastermind/widgets/board.dart';
import 'package:mastermind/widgets/refresh_button.dart';
import 'package:mastermind/widgets/toggle_theme.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    // Generate ColorList and a Solution on startup
    ref.read(boardState).genColorList();
    ref.read(boardState).genSolutionFromColorList();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(isDarkTheme);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkTheme ? Colors.white : Colors.black,
          ),
        ),
        actions: const [
          SizedBox(width: 10),
          RefreshButton(),
          SizedBox(width: 10),
          ToggleThemeButton(),
          SizedBox(width: 10),
          Icon(
            Icons.help_rounded,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        if (width < 390) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Board(
              height: height,
              width: width,
            ),
          );
        } else if (width < 428) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Board(
              height: height,
              width: width,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Board(
              height: height,
              width: width,
            ),
          );
        }
      }),
    );
  }
}
