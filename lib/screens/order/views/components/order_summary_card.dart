import 'package:flutter/material.dart';

import '../../../../constants.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.subTotal,
    this.shippingFee = 0,
    required this.total,
    this.discount,
  }) : super(key: key);
  final double subTotal, shippingFee, total;
  final double? discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadious)),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: OrderSummaryText(
              leadingText: "Subtotal",
              trilingText: "\$$subTotal",
            ),
          ),
          OrderSummaryText(
            leadingText: "Shipping Fee",
            trilingText: shippingFee == 0 ? "Free" : "\$$shippingFee",
            trilingTextColor: shippingFee == 0 ? successColor : null,
          ),
          if (discount != null) const SizedBox(height: defaultPadding / 2),
          if (discount != null)
            OrderSummaryText(
                leadingText: "Discount", trilingText: "\$$discount"),
          const Divider(height: defaultPadding * 2),
          OrderSummaryText(
            leadingText: "Total",
            trilingText: "\$$total",
          ),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}

class OrderSummaryText extends StatelessWidget {
  const OrderSummaryText({
    Key? key,
    required this.leadingText,
    required this.trilingText,
    this.trilingTextColor,
  }) : super(key: key);

  final String leadingText, trilingText;
  final Color? trilingTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(leadingText),
        const Spacer(),
        Text(
          trilingText,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: trilingTextColor),
        ),
      ],
    );
  }
}
