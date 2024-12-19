import 'package:excel_test/app/router.dart';
import 'package:excel_test/app/widgets.dart';
import 'package:excel_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(showAll: false),
          Expanded(child: Center(child: Assets.images.gameLogoBig.image())),
          const _HomeFooter(),
        ],
      ),
    );
  }
}

class _HomeFooter extends StatelessWidget {
  const _HomeFooter();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream<int>.periodic(const Duration(milliseconds: 25), (x) => x).take(102),
      initialData: 0,
      builder: (_,i) {
        if (i.data! < 101) {
          return _Loader(i.data!);
        }
      return ContinueButton(onPressed: () => context.pushNamed(Routes.menu));
    });
  }
}

class _Loader extends StatelessWidget {
  const _Loader(this.percent);

  final int percent;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final loaderPosition = (100 - percent) / 100 * maxWidth;

    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Positioned.fill(
            right: loaderPosition,
            child: const ColoredBox(color: Colors.white)
          ),
          Positioned.directional(start: 0,
          textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                '$percent%', 
                style: TextStyle(
                  color: percent < 15 ? Colors.white : Colors.black,
                  fontSize: 48,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}