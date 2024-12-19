import 'package:excel_test/app/router.dart';
import 'package:excel_test/app/widgets.dart';
import 'package:excel_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {

  Set<int> selected = {};
  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 12,
              crossAxisSpacing: 16,
              childAspectRatio: 0.78,
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: List.generate(
                _cardMetaData.length,
                (i) => _SelectionCard(
                  data: _cardMetaData[i],
                  onTap: (){
                    final wasAdded = selected.add(i);
                    if (!wasAdded) {
                      selected.remove(i);
                    }
                    setState(() { });
                  },
                  ),
                )
              ),
            ),  
          ContinueButton(
            onPressed: selected.isEmpty ? null : () => context.pushNamed(Routes.vs)
          ),
        ],
      ),
    );
  }
}


class _SelectionCard extends StatelessWidget {
  const _SelectionCard({
    required this.data,
    required this.onTap,
  });

  final _CardMetaData data;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Assets.images.cardSurface.image(fit: BoxFit.cover)),
        const Positioned.fill(child: Opacity(opacity: 0.6, child: ColoredBox(color: Colors.black))),
        Positioned.fill(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:[
              _CardTop(data.abv, onTap),
              const SizedBox(height: 12),
              _CardBody(data)
            ],
          ),
        ),
      ],
    );
  }
}

final _cardMetaData = [
  _CardMetaData(
    abv: 'ICAN',
    name: 'Institute Chartered Accountants of Nigeria',
    image1: Assets.images.icon.image(),
    image2: Assets.images.productPic12.image(),
    color: const Color(0xFF0F0BAB)
  ),
  _CardMetaData(
    abv: 'ACCA',
    name: 'Association of Chartered Certified Accountants',
    image1: Assets.images.icon1.image(),
    image2: Assets.images.cISLogo11.image(),
    color: const Color(0xFFFF822B)
  ),
  _CardMetaData(
    abv: 'CITN',
    name: 'Chartered Institute of Taxation of Nigeria',
    image1: Assets.images.icon2.image(),
    image2: Assets.images.cITNLogo11.image(),
    color: const Color(0xFF1FAF73)
  ),
  _CardMetaData(
    abv: 'CIMA',
    name: 'Chartered Institute of Management Accountants (CIMA)',
    image1: Assets.images.icon3.image(),
    image2: Assets.images.cIMALogo2.image(),
    color: const Color(0xFF9747FF)
  ),
  _CardMetaData(
    abv: 'CIBN',
    name: 'Chartered Institute of Bankers of Nigeria',
    image1: Assets.images.icon4.image(),
    image2: Assets.images.cIBNLogo11.image(),
    color: const Color(0xFFFF822B)
  ),
  _CardMetaData(
    abv: 'ANAN',
    name: 'Association of National Accountants of Nigeria ',
    image1: Assets.images.icon5.image(),
    image2: Assets.images.anan2.image(),
    color: const Color(0xFF0F0BAB)
  ),
];

class _CardMetaData{
  final String abv;
  final String name;
  final Color color;
  final Widget image1;
  final Widget image2;

  _CardMetaData({required this.abv, required this.name, required this.color, required this.image1, required this.image2});
}

class _CardBody extends StatelessWidget {
  const _CardBody(this.data);

  final _CardMetaData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  data.image1,
                  const SizedBox(width: 12),
                  data.image2,
                ],
              ),
              const SizedBox(height: 8),
              Text(data.name, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        Container(color: data.color, width: 10, height: 162)
      ],
    );
  }
}

class _CardTop extends StatelessWidget {
  const _CardTop(this.abv, this.onTap);

  final String abv;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(abv, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          _Checkbox(onTap)
        ],
      ),
    );
  }
}

class _Checkbox extends StatefulWidget {
  const _Checkbox(this.onTap);
  final void Function() onTap;

  @override
  State<_Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<_Checkbox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap();
        isSelected = !isSelected;
        setState(() { });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xAA323232), width: 1)
        ),
        child: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
 