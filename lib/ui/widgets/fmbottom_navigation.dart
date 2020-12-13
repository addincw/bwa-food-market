part of 'widgets.dart';

class FmBottomNavigation extends StatelessWidget {
  final currentIndex;
  final Function onTap;

  FmBottomNavigation({this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: tPrimaryColor,
      unselectedItemColor: tSubtitleColor,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (item) {
        if (onTap != null) onTap(item);
      },
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            'assets/ic_home_normal.png',
            width: 24,
            height: 24,
          ),
          activeIcon: ImageIcon(AssetImage('assets/ic_home.png')),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            'assets/ic_order_normal.png',
            width: 24,
            height: 24,
          ),
          activeIcon: ImageIcon(AssetImage('assets/ic_order.png')),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            'assets/ic_profile_normal.png',
            width: 24,
            height: 24,
          ),
          activeIcon: ImageIcon(AssetImage('assets/ic_profile.png')),
        ),
      ],
    );
  }
}
