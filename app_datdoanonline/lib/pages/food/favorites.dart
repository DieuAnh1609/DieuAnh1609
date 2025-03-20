import 'package:app_datdoanonline/widgets/big_text.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  final List<String> favoriteItems;

  Favorites({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText (
          text: "Favorites",
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[200],
      ),
      body: favoriteItems.isEmpty
          ? Center(child: Text("Danh sách yêu thích trống."))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteItems[index]),
                  trailing: Icon(Icons.favorite, color: Colors.pink[200]),
                );
              },
            ),
    );
  }
}

