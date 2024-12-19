import 'package:excel_test/app/router.dart';
import 'package:excel_test/app/widgets.dart';
import 'package:excel_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  int? selected;
  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          const Expanded(child: SizedBox.expand()),
          ...List.generate(
            _cardMetaData.length * 2,
            (i){
              if(i.isEven){
                final j = i~/2;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: InkWell(
                    onTap: (){
                      selected = j;
                      setState(() {});
                    },
                    child: _SelectionCard(data: _cardMetaData[j], isSelected: selected == j),
                  ),
                );
              }
              return const SizedBox(height: 20);
            }
            ),
          ContinueButton(
            onPressed: selected != 1 ? null : () => context.pushNamed(Routes.selection)
          ),
        ],
      ),
    );
  }
}

class _SelectionCard extends StatelessWidget {
  const _SelectionCard({required this.data, required this.isSelected});

  final _CardMetaData data;
  final bool isSelected;
  
  final _titleColor = const Color(0xAAF3F3F1);
  final _subtitleColor = const Color(0xAA999999);
  final _backgroundColor = Colors.transparent;
  final _borderColor = const Color(0xAA2A2A2A);

  final _selectedTitleColor = const Color(0xAAF3F3F1);
  final _selectedSubtitleColor = const Color(0xAA999999);
  final _selectedBackgroundColor = const Color(0xAA331A09);
  final _selectedBorderColor = const Color(0xAAFF822B);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
           color: isSelected ? _selectedBackgroundColor : _backgroundColor,
           borderRadius: BorderRadius.circular(4),
           border: Border.all(
            color: isSelected ? _selectedBorderColor: _borderColor,
            width: 3,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Flexible(
              child: _TextSection(
                title: data.title,
                subtitle: data.subtitle,
                titleColor: isSelected ? _selectedTitleColor : _titleColor,
                subtitleColor: isSelected ? _selectedSubtitleColor : _subtitleColor,
                warning: data.warning,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _TextSection extends StatelessWidget {
  const _TextSection({
    required this.title,
    required this.subtitle,
    required this.titleColor,
    required this.subtitleColor,
    this.warning,
  });

  final String title;
  final String subtitle;
  final String? warning;
  final Color titleColor;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[ 
        Text(title, style: TextStyle( fontSize: 16, color: titleColor, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(subtitle, style: TextStyle( fontSize: 14, color: subtitleColor, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        if (warning != null) Row (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.images.information.image(),
            Expanded(
              child: Text(
                warning!,
                maxLines: 4,
                style: const TextStyle( fontSize: 12, color: Color(0xAA545454))),
            )
          ],
        )
      ],
    );
  }
}

final _cardMetaData = [
  _CardMetaData(
    title: 'Play with Zaraline (bot)',
    subtitle: 'Quiz with a bot real-time and get scored to beat the highest scores',
    warning: 'This is not available at the moment as we are currently fixing it. We will be back shortly',
  ),
  _CardMetaData(
    title: 'Play with someone on the app',
    subtitle: 'Quiz with someone real-time and get scored to beat the highest scores',
  ),
];

class _CardMetaData{
  final String title;
  final String subtitle;
  final String? warning;

  _CardMetaData({required this.title, required this.subtitle, this.warning});
}


 