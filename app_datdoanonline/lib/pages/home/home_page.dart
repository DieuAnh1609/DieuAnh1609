import 'package:app_datdoanonline/pages/cart/order_history_page.dart';
import 'package:app_datdoanonline/pages/food/favorites.dart';
import 'package:app_datdoanonline/pages/home/main_food_page.dart';
import 'package:app_datdoanonline/profile_user_page.dart';
import 'package:flutter/material.dart';
import 'package:app_datdoanonline/models/auth/login_response.dart';


class HomePage extends StatefulWidget {
  final LoginResponse response; 

  const HomePage({Key? key, required this.response}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
   List<String> favoriteItems = [];
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const MainFoodPage(), 
      Favorites(favoriteItems: favoriteItems),
      const OrderHistoryPage(), 
      ProfileUserPage(response: widget.response), 
      
    ];
  }

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap: onTapNav,
        selectedItemColor: Colors.pink[300], 
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"), 
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
          
        ],
      ),
    );
  }
}
