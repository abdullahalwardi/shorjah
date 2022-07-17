import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.title,
    required this.address,
    required this.pnNumber,
    this.isActive = false,
    required this.press,
  }) : super(key: key);

  final String title, address, pnNumber;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(
        Radius.circular(defaultPadding),
      ),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(
              color: isActive ? primaryColor : Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isActive
                      ? primaryColor
                      : Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.1),
                  child: SvgPicture.asset(
                    "assets/icons/Location.svg",
                    height: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: isActive ? primaryColor : null),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Text(address),
            const SizedBox(height: defaultPadding / 2),
            Text(
              pnNumber,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
