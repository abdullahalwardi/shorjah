import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';

class MySmallButton extends StatelessWidget {
  const MySmallButton({
    Key? key,
    this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String? svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2.5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            if (svgSrc != null)
              SvgPicture.asset(
                svgSrc!,
                height: 20,
                color: Theme.of(context).iconTheme.color,
              ),
            // if (svgSrc != null) const SizedBox(width: defaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
