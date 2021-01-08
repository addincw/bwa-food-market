part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController categoryTabController;
  List<Tab> categoryTabs = [Tab(text: 'Account'), Tab(text: 'FoodMarket')];
  int categoryTabIndex = 0;

  @override
  void initState() {
    super.initState();
    categoryTabController = TabController(
      length: categoryTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    categoryTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 26),
        Container(
          width: 90,
          height: 90,
          margin: EdgeInsets.only(bottom: tDefaultMargin),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/photo_border.png'),
            ),
          ),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        NetworkImage((state as AuthSignedIn).user.picturePath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Text(
              (state as AuthSignedIn).user.name,
              style: GoogleFonts.poppins().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ),
        SizedBox(height: 6),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Text(
              (state as AuthSignedIn).user.email,
              style: tSubtitleFontSyle,
            );
          },
        ),
        SizedBox(height: 26),
        TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicator: MD2Indicator(
            indicatorHeight: 3,
            indicatorColor: Colors.black,
            indicatorSize: MD2IndicatorSize.normal,
          ),
          labelColor: Colors.black,
          labelStyle: tButtonPrimaryFontSyle,
          unselectedLabelColor: tSubtitleColor,
          unselectedLabelStyle: tSubtitleFontSyle,
          controller: categoryTabController,
          tabs: categoryTabs,
          onTap: (tabIndex) {
            setState(() {
              categoryTabIndex = tabIndex;
            });
          },
        ),
        Builder(builder: (context) {
          List<Widget> menus = [];

          switch (categoryTabIndex) {
            case 0:
              menus = [
                renderMenuItem(name: 'Edit Profile'),
                renderMenuItem(name: 'Home Address'),
                renderMenuItem(name: 'Security'),
                renderMenuItem(name: 'Payment'),
              ];
              break;

            case 1:
              menus = [
                renderMenuItem(name: 'Rate App'),
                renderMenuItem(name: 'Help Center'),
                renderMenuItem(name: 'Privacy & Policy'),
                renderMenuItem(name: 'Term & Conditions'),
              ];
              break;
          }

          return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 16,
              left: tDefaultPadding,
              right: tDefaultPadding,
            ),
            child: Column(children: menus),
          );
        }),
      ],
    );
  }

  Widget renderMenuItem({name, onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins().copyWith(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Icon(
              MdiIcons.chevronRight,
              color: tSubtitleColor,
            ),
          ],
        ),
      ),
    );
  }
}
