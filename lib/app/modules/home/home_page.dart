import 'package:desafio/app/components/BottomBar.dart';
import 'package:desafio/app/modules/home/feed/feed_page.dart';
import 'package:flutter/material.dart';
import '../../app_theme.dart';

class AppMainPage extends StatefulWidget {
  @override
  _AppMainPageState createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, box) {
        return Scaffold(
            body: Container(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children: <Widget>[
                  FeedPage(),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavBar(
              selectedIndex: _selectedIndex,
              showElevation: true,
              curve: Curves.easeInOut,
              backgroundColor: AppTheme.primaryColor,
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }),
              items: [
                BottomNavBarItem(
                    icon: Icon(Icons.whatshot),
                    title: Text('Feed'),
                    activeColor: Colors.white),
                BottomNavBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Perfil'),
                  activeColor: Colors.white,
                ),
                BottomNavBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Amigos'),
                  activeColor: Colors.white,
                ),
                BottomNavBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Mensagens'),
                  activeColor: Colors.white,
                ),
                BottomNavBarItem(
                  icon: Icon(Icons.build),
                  title: Text('Configurações'),
                  activeColor: Colors.white,
                ),
              ],
            ));
      },
    );
  }
}
