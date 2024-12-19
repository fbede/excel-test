import 'package:excel_test/app/router.dart';
import 'package:excel_test/app/widgets.dart';
import 'package:excel_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VsScreen extends StatelessWidget {
  const VsScreen({super.key});

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Header(),
          const SizedBox(height: 16),
          _UserCard(_userInfo[0]),
          const SizedBox(height: 16),
          Assets.images.vs.image(),
          const SizedBox(height: 16),
          _UserCard(_userInfo[1]),
          const SizedBox(height: 16),
          const ContinueButton(),
        ],
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard(this.data);

  final _UserData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 36, foregroundImage: data.imageProvider),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(data.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.coins.image(),
                const SizedBox(width: 8),
                Text(data.score, style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Container(color: data.color, width: 150, height: 15),
          ]
        ),
      ],
    );
  }
}

final _userInfo = [
  _UserData(
    name: 'Chioma Matthew',
    score: '1,887 Pts',
    color: const Color(0xFF441FAF),
    imageProvider: Assets.images.user1.provider()
  ),
  _UserData(
    name: 'Agada Sunday',
    score: '12,887 Pts',
    color: const Color(0xFFAF1FA9),
    imageProvider: Assets.images.user2.provider()
  ),
];

class _UserData {
  final String name;
  final String score;
  final Color color;
  final ImageProvider imageProvider;

  _UserData({required this.imageProvider, required this.name, required this.score, required this.color});
}