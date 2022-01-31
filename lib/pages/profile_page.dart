import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_figma_ui/pages/theme_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const String id = "profile_page";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List posts = [
    {"image":"assets/images/image_1.jpeg", "isVideo":false},
    {"image":"assets/images/image_2.jpeg", "isVideo":false},
    {"image":"assets/images/image_3.jpeg", "isVideo":false},
    {"image":"assets/images/image_4.jpeg", "isVideo":false},
    {"image":"assets/images/image_5.jpeg", "isVideo":false},
    {"image":"assets/images/image_6.jpeg", "isVideo":true},
    {"image":"assets/images/image_7.jpeg", "isVideo":false},
    {"image":"assets/images/image_8.jpeg", "isVideo":false},
    {"image":"assets/images/image_9.jpeg", "isVideo":false},
    {"image":"assets/images/image_10.jpeg", "isVideo":true},
    {"image":"assets/images/image_11.jpeg", "isVideo":false},
    {"image":"assets/images/image_12.jpeg", "isVideo":false},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (BuildContext context,  ThemeModel themeNotifier, Widget? child) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/Private.svg", color: Theme.of(context).primaryColor),
              const SizedBox(
                width: 6,
              ),
              Text(
                "jacob_w",
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
              ),
              const SizedBox(
                width: 6,
              ),
              SvgPicture.asset("assets/icons/down.svg", color: Theme.of(context).primaryColor)
            ],
          ),
          centerTitle: true,
          actions: [
            MaterialButton(onPressed: () {
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true;
            },
                minWidth: 30,
                child: SvgPicture.asset("assets/icons/Menu.svg", color: Theme.of(context).primaryColor)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Home.svg", color: Theme.of(context).primaryColor), title: Container()),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Search.svg", color: Theme.of(context).primaryColor), title: Container()),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Plus.svg", color: Theme.of(context).primaryColor), title: Container()),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Like.svg", color: Theme.of(context).primaryColor), title: Container()),
            BottomNavigationBarItem(icon: Container(
              padding: const EdgeInsets.all(1),
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5)),
              child: Image.asset("assets/images/Profile.png"),
            ), title: Container()),
          ],

        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor:Theme.of(context).backgroundColor,
                toolbarHeight: MediaQuery.of(context).size.height*0.45,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // #profile_image&stats
                    Padding(
                      padding: const EdgeInsets.only(right: 11, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height*0.12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Theme.of(context).cardColor, width: 1.5)),
                              child: Image.asset("assets/images/Profile.png"),
                            ),
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "54",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Posts",
                                    style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              )),
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "834",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                    "Followers",
                                    style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              )),
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "162",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),

                    // #bio
                    Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Text(
                          "Jacob West",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor),
                        )),
                    RichText(
                      text: TextSpan(
                          text: "Digital goodies designer ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                              height: 1.4),
                          children: [
                            TextSpan(
                                text: "@pixsellz",
                                style: TextStyle(color: themeNotifier.isDark?const Color(0xffF9F9F9):const Color(0xff05386b))),
                            const TextSpan(text: "\nEverything is designed"),
                          ]),
                    ),

                    // #edit_profile_button
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: Theme.of(context).cardColor
                              )),
                              backgroundColor: themeNotifier.isDark?MaterialStateProperty.all(Colors.black):MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              overlayColor: themeNotifier.isDark?MaterialStateProperty.all(Colors.grey.shade900):MaterialStateProperty.all(Colors.grey.shade100),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 0.8),
                          )),
                    ),

                    // #stories
                    Container(
                      height: MediaQuery.of(context).size.height*0.105,
                      padding: const EdgeInsets.only(right: 14),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.165,
                                  height: MediaQuery.of(context).size.width*0.165,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Theme.of(context).cardColor, width: 1.5)),
                                  child: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "New",
                                  style: TextStyle(
                                      fontSize: 12, color: Theme.of(context).primaryColor
                                  ),
                                )
                              ],
                            ),
                          ),
                          _stories("assets/images/Friends.png", "Friends"),
                          _stories("assets/images/Sport.png", "Sport"),
                          _stories("assets/images/Design.png", "Design"),
                        ],
                      ),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(49),
                  child:
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).cardColor
                        )
                      )
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                          indicatorColor: Theme.of(context).primaryColor,
                          tabs: [
                            Tab(
                              icon: SvgPicture.asset("assets/icons/Grid.svg", color: Theme.of(context).primaryColor),
                            ),
                            Tab(
                              icon: SvgPicture.asset("assets/icons/Tags.svg", color: Theme.of(context).primaryColor),
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // #posts
                SizedBox(
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        itemCount: posts.length*2,
                        itemBuilder: (context, index) {
                          return _posts(posts[index%posts.length]["image"], posts[index%posts.length]["isVideo"]);
                        })),

              ],
            ),
          ),
        )
      );
    },);
  }
  Widget _stories(String image, String name) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 18),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              height: MediaQuery.of(context).size.width*0.165,
              width: MediaQuery.of(context).size.width*0.165,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).cardColor,
                  width: 1.5
                )
              ),
              child: Image.asset(image),
            ),
            const SizedBox(
              height: 3,
            ),
            Flexible(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13, color: Theme.of(context).primaryColor),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                )),
          ],
        ),
      ),
    );
  }

  Widget _posts(String image, bool isVideo){
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: MediaQuery.of(context).size.width*0.33,
      height: MediaQuery.of(context).size.width*0.33,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
        )
      ),
      child: isVideo?SvgPicture.asset("assets/icons/Video.svg"):null,
    );
  }

}
