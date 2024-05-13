import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
];

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your interests"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v32,
              const Text("Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.bold,
                  )),
              Gaps.v20,
              const Text(
                "Get better video recommendations",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              Gaps.v48,
              Wrap(
                runSpacing: 15,
                spacing: 15,
                children: [
                  for (var interest in interests)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size24,
                        vertical: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Sizes.size24),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                          ]),
                      child: Text(
                        interest,
                        style: const TextStyle(
                          // fontSize: Sizes.size14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // surfaceTintColor: Colors.grey.shade00,
        height: 100,
        elevation: 0.3,
        // color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size20,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: Container(
            // padding: const EdgeInsets.symmetric(
            //   vertical: Sizes.size20,
            // ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
