import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/users/widgets/persistant_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text("Moon"),
              actions: [
                IconButton(
                  onPressed: _onGearPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.gear,
                  ),
                ),
              ],
            ),
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
                    widthFactor: 0.6,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size52,
                                vertical: Sizes.size10),
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
                        Container(
                          padding: const EdgeInsets.all(Sizes.size8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          child: const FaIcon(FontAwesomeIcons.youtube,
                              size: Sizes.size20),
                        ),
                        Container(
                          padding: const EdgeInsets.all(Sizes.size10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          child: const FaIcon(FontAwesomeIcons.download,
                              size: Sizes.size16),
                        ),
                      ],
                    ),
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
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistantTabBar(),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: Sizes.size2,
              mainAxisSpacing: Sizes.size2,
              childAspectRatio: 9 / 14,
            ),
            itemBuilder: (context, index) => Stack(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 14,
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholder: "assets/images/kyu1.jpg",
                      image:
                          "https://images.unsplash.com/photo-1715791546577-dfdd588f734e?q=80&w=3388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                ),
                const Positioned(
                  bottom: 1,
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow_outlined, color: Colors.white),
                      Text(
                        "4.1M",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index == 0)
                  Positioned(
                      left: 4,
                      top: 3,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size4,
                            vertical: Sizes.size3,
                          ),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: const Text("Pinned",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size12,
                                fontWeight: FontWeight.bold,
                              )))),
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
