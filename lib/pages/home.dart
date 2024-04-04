import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/basketball_shoes.dart';
import 'package:go_router_sample/pages/cricket_shoes.dart';
import 'package:go_router_sample/pages/lifestyle_shoes.dart';
import 'package:go_router_sample/Model/data_model.dart';
import 'package:go_router_sample/pages/running_shoes.dart';
import 'package:go_router_sample/pages/shop_now_button_screen.dart';
import 'package:go_router_sample/project/routes/app_route_constants.dart';
import 'package:go_router_sample/project/routes/app_route_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    NyAppRouter.returnRouter(true); // Assuming isAuth is true
    switch (index) {
      case 0:
        GoRouter.of(context).push(Uri(path: '/').toString());
        break;
      case 1:
        GoRouter.of(context).push(Uri(path: '/about').toString());
        break;
      case 2:
        GoRouter.of(context).pushNamed(MyAppRouteConstants.profileRouteName,
            params: {'username': 'Khurram', 'userid': 'Khurram12345'});
        break;
      case 3:
        GoRouter.of(context).push(Uri(path: '/contact_us').toString());
        break;
      case 4:
        GoRouter.of(context).push(Uri(path: '/settings').toString());
        break;
      default:
        // Handle other cases here
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () {
            // Handle your list icon tap here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle your search icon tap here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            height: 200,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust the radius as needed
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/shoe4.png', // Path to your image file in the assets folder
                        width: double.infinity,
                        height: 180, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Release',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Nike Air',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Max 90',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopNowDetailScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Shop Now',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                      if (i == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LifestyleShoesGridView()),
                        );
                      }else if (i == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BasketBallShoesGridView()),
                        );
                        }else if (i == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RunningShoesGridView()),
                        );
                        }else if (i == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CricketShoesGridView()),
                        );
                        };
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      margin: EdgeInsets.only(
                          left: 10, top: 5, right: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color: i == selectedIndex
                            ? Colors.red
                            : const Color.fromARGB(255, 219, 210, 209),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            i == selectedIndex
                                ? Icon(Icons.favorite, color: Colors.white)
                                : Icon(Icons.favorite_border,
                                    color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              i == 0
                                  ? 'Lifestyle'
                                  : i == 1
                                      ? 'Basketball'
                                      : i == 2
                                          ? 'Running'
                                          : 'Cricket',
                              style: TextStyle(
                                  color: i == selectedIndex
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Men\'s',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child:
                ProductGridView(), // Displaying ProductGridView inside the Expanded widget
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man_rounded),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quick_contacts_dialer_sharp),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 214, 46, 68),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
