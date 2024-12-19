import 'package:excel_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  const Header({super.key, this.showAll = true});

final bool showAll;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: showAll,
            child: Assets.images.gameLogoSmall.image(),
            ),
          Assets.images.leaderboard.image(),
        ],
        ),
    );
  }
}

class ContinueButton extends StatelessWidget{
final void Function()? onPressed;

  const ContinueButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: FilledButton(
        onPressed: onPressed == null ? null :() => onPressed!(),
        style: FilledButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xAAFF822B),
          minimumSize: const Size(double.infinity, 44),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))
        ), 
        child: const Text('CONTINUE'),
        ),
    );
  }
}