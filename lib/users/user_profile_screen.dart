import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(title: const Text("Moon"), actions: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                ),
              ),
            ]),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/90151845?v=4"),
                    child: Text("문경"),
                  ),
                  Gaps.v20,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "@mkjoehsb",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h10,
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.blue,
                        size: Sizes.size16,
                      )
                    ],
                  ),
                  Gaps.v10,
                  SizedBox(
                    height: Sizes.size48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FollowingInfo(number: "37", title: "Following"),
                        VerticalDivider(
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          color: Colors.grey.shade500,
                          indent: 14,
                          endIndent: 14,
                        ),
                        const FollowingInfo(
                            number: "10.5M", title: "Followers"),
                        VerticalDivider(
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          color: Colors.grey.shade500,
                          indent: 14,
                          endIndent: 14,
                        ),
                        const FollowingInfo(number: "149.3M", title: "Likes"),
                      ],
                    ),
                  ),
                  Gaps.v14,
                  FractionallySizedBox(
                    widthFactor: 0.33,
                    child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: Sizes.size12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              Sizes.size4,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Gaps.v14,
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size32,
                    ),
                    child: Text(
                      "All highlights and where to watch live matches on FIFA",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.link,
                        size: Sizes.size14,
                      ),
                      Gaps.h4,
                      Text("https://www.fifa.com/fifaplus/en/home",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                  Gaps.v14,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Colors.grey.shade200,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: const TabBar(
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                      ),
                      tabs: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.size20),
                          child: Icon(
                            Icons.grid_4x4_rounded,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.size20),
                          child: FaIcon(FontAwesomeIcons.heart),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(children: [
          GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: 20,
            padding: const EdgeInsets.all(
              Sizes.size6,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
              childAspectRatio: 9 / 21,
            ),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    Sizes.size8,
                  )),
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.cover,
                        placeholder: "assets/images/kyu1.jpg",
                        image:
                            "https://images.unsplash.com/photo-1571936804022-90d128047136?q=80&w=2753&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                ),
                Gaps.v10,
                const Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  "This is a very long captain for my tiktok that in upload just now currently",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v5,
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/90151845?v=4"),
                      ),
                      Gaps.h4,
                      const Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "My Avatar is going to be vely long",
                        ),
                      ),
                      Gaps.h4,
                      FaIcon(
                        FontAwesomeIcons.heart,
                        size: Sizes.size16,
                        color: Colors.grey.shade600,
                      ),
                      Gaps.h2,
                      const Text(
                        "2.5M",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text("page 2"),
          ),
        ]),
      ),
    );
  }
}

class FollowingInfo extends StatelessWidget {
  const FollowingInfo({
    super.key,
    required this.number,
    required this.title,
  });
  final String number;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size18,
            )),
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
