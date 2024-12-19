import 'package:excel_test/app/widgets.dart';
import 'package:excel_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  Set<int> selected = {1};
  final _answers = [
    'Indirect Costs',
    'Variable Costs',
    'Semi-Variable Costs',
    'Performance Evaluation',
  ];

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          _Header(),
          const SizedBox(height: 24),
          _Question(),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              //childAspectRatio: 0.78,
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: List.generate(
                _answers.length,
                (i) => _Answer(
                  data: _answers[i],
                  onTap: (x){
                    setState(() { 
                      if (x == null) {
                        selected.remove(i);
                      }else{
                        selected.add(i);
                      }
                    });
                  },
                  ),
                )
              ),
            ),  
          const SizedBox(height: 16),
          _Footer(
            selected: selected,
            onPressed: () async {
              await showModalBottomSheet(
                backgroundColor: const Color(0xFF191919),
                elevation: 0,
                context: context, 
                builder: (_)=>_Leaderboards(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({ required this.selected, required this.onPressed, this.text });

  final Set<int> selected;
  final void Function() onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {

  if (selected.isEmpty) {
    return const SizedBox.shrink();
  }

  return ColoredBox(
      color: const Color(0xFF191919),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24,12,24,0),
            child: Row(
              children: [
                const Text('Keep going Buddy! ✌', style: TextStyle(fontSize: 16)),
                const Expanded(child: SizedBox()),
                Assets.images.repeatemusic.image(),
                const SizedBox(width: 12),
                Assets.images.flag.image(),
                const SizedBox(width: 12),
                Assets.images.infocircle.image(),
              ],
            ),
          ),
          ContinueButton(
            onPressed: onPressed,
            text: text,
          ),
        ],
      ),
    );
  }
}

class _Answer extends StatefulWidget {
  const _Answer({required this.data, required this.onTap});

  final String data;
  final void Function(bool?) onTap;

  @override
  State<_Answer> createState() => _AnswerState();
}

class _AnswerState extends State<_Answer> {

  final selections = [null, true, false];
  bool? isSelected;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _determineDecoration,
        child: Center(
          child: Text(
            widget.data,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  BoxDecoration get _determineDecoration {
    return switch (isSelected) {
      null => BoxDecoration(color: const Color(0xFF191919), borderRadius: BorderRadius.circular(8)),
      true => BoxDecoration(
        color: const Color(0xFF0A3A26),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1FAF73))
      ),
      false => BoxDecoration(
        color: const Color(0xFF490E18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDA2949))
      ),
    };
  }

  void onTap(){
    setState(() {
      index++;
      if (index > 2) index = 0;
      isSelected = selections[index];
      widget.onTap(isSelected);
    });
  }
}

class _Question extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
           color: const Color(0xFF191919),
           borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'What are the different types of costs in management accounting?',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
  }
  
}

class _Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _UserCard(_userInfo[0]),
          _Timer(),
          _UserCard(_userInfo[1]),
        ],
      ),
    );
  }
}

class _Timer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 74,
        width: 74,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFF822B)),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: StreamBuilder(
            stream: Stream<int>.periodic(const Duration(seconds: 1), (x) => 30 - x).take(31),
            initialData: 30,
            builder: (_,i) => Text(
              i.data!.toString().padLeft(2,'0').padLeft(3,'00:'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard(this.data);

  final _UserData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 24, foregroundImage: data.imageProvider),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.coins.image(),
            const SizedBox(width: 4),
            Text(data.score, style: const TextStyle(fontSize: 14)),
          ],
        ),
        const SizedBox(height: 12),
        Container(color: data.color, width: 100, height: 12),
      ],
    );
  }
}

final _userInfo = [
  _UserData(
    score: '0 Pts',
    color: const Color(0xFF441FAF),
    imageProvider: Assets.images.user1.provider()
  ),
  _UserData(
    score: '0 Pts',
    color: const Color(0xFFAF1FA9),
    imageProvider: Assets.images.user2.provider()
  ),
];

class _UserData {

  final String score;
  final Color color;
  final ImageProvider imageProvider;

  _UserData({required this.imageProvider, required this.score, required this.color});
}

class _Leaderboards extends StatelessWidget {
  const _Leaderboards();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 524,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text('Your Final Score'),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.coins.image(),
                const Text('334', style: TextStyle(fontSize: 78, fontWeight: FontWeight.bold)),
                const Text('Points overall'),
              ],
            ),
          ),
          _Footer(selected: const {1}, onPressed: (){}, text: 'VIEW LEADERBOARD'),
        ],
      ),
    );
  }
}