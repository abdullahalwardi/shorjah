import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/components/my_outlined_button.dart';
import 'package:shop/components/outlined_active_button.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/screen_export.dart';
import 'package:shop/screens/order/views/components/order_summary_card.dart';

import 'components/order_summery.dart';

class ThanksForOrderScreen extends StatelessWidget {
  const ThanksForOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Share.svg",
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? "assets/Illustration/Success_darkTheme.png"
                      : "assets/Illustration/Success_lightTheme.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              Text(
                "Thanks for your order",
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Text.rich(
                  TextSpan(
                    text: "You’ll receive an email at  ",
                    children: [
                      TextSpan(
                        text: "your.mail@gmail.com",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(text: "  once your order is confirmed.")
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: OrderSummary(
                  orderId: "FDS639820",
                  amount: 476.98,
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, ordersScreenRoute);
                },
                icon: SvgPicture.asset(
                  "assets/icons/Trackorder.svg",
                  color: Colors.white,
                ),
                label: const Text("Track order"),
              ),
              const Spacer(),
              OutlinedActiveButton(
                  // icon: const Icon(Icons.home_filled),
                  text: 'Back to home',
                  press: () {
                    Navigator.pushNamed(context, entryPointScreenRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
