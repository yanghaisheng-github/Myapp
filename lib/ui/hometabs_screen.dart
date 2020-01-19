import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../widgets/bubbled_navigation_bar.dart';
import 'hometabs/home_page.dart';
import 'hometabs/contact_page.dart';
import 'hometabs/agreement_page.dart';
import 'hometabs/nearby_page.dart';
import 'hometabs/settings_page.dart';

class HomeTabs extends StatefulWidget {
  final titles = ['消息', '契约', '有趣', '一起', '我的'];
  final colors = [
    Colors.green,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.cyan
  ];
  final icons = [
    CupertinoIcons.bell,
    CupertinoIcons.person,
    CupertinoIcons.location,
    CupertinoIcons.info,
    CupertinoIcons.profile_circled
  ];

  int page_index = 0;

  HomeTabs({Key key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //设置没有返回按钮
          automaticallyImplyLeading: false,
          title: Text(widget.titles[widget.page_index]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print('search');
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                print('add');
              },
            ),
          ],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              ContactPage(),
              HomePage(),
              NearbyPage(),
              AgreementPage(),
              SettingsPage()
            ],
                // widget.colors.map((Color c) => Container(color: c)).toList(),
            onPageChanged: (page) {
              setState(() {
                widget.page_index = page;
              });
              print(page);
            },
          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Colors.white,
          defaultBubbleColor: Colors.blue,
          onTap: (index) {
            _pageController.animateToPage(index,
                curve: Curves.easeInOutQuad,
                duration: Duration(milliseconds: 500));
          },
          items: widget.titles.map((title) {
            var index = widget.titles.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
              icon: getIcon(index, color),
              activeIcon: getIcon(index, Colors.white),
              bubbleColor: color,
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
        ));
  }
}
