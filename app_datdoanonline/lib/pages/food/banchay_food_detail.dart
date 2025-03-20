import 'package:app_datdoanonline/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BanchayFoodDetail extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final double price; 
  final Function(String, String, int) onAddToCart;
  

  BanchayFoodDetail({
    required this.title,
    required this.image,
    required this.description,
    required this.price, 
    required this.onAddToCart,
  });

  @override
  _BanchayFoodDetailState createState() => _BanchayFoodDetailState();
}

class _BanchayFoodDetailState extends State<BanchayFoodDetail> {
  int quantity = 1;
  bool isFavorite = false; 

  
  static List<String> favoriteItems = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (spc.getTotalQuantity() > 0)
                  Positioned(
                    right: 0,
                    top: -3,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Text(
                        spc.getTotalQuantity().toString(),
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 20),
                Text(
                  "Giá: ${widget.price.toStringAsFixed(0)} VNĐ", // Hiển thị giá
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Số lượng",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[200],
                        minimumSize: Size(200, 40), // Kích thước nhỏ cho nút
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      icon: Icon(Icons.add_shopping_cart, size: 20), 
                      label: Text(
                        "Thêm vào giỏ hàng",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        final item = ItemInCart(
                          nameProduct: widget.title,
                          imageProduct: widget.image,
                          priceProduct: widget.price,
                          quantity: quantity,
                        );

                        spc.addItem(item);

                        Get.snackbar(
                          "Thành công",
                          "$quantity ${widget.title} đã được thêm vào giỏ hàng!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue[200],
                          colorText: Colors.white,
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.pink[200] : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          if (isFavorite) {
                            favoriteItems.add(widget.title);
                          } else {
                            favoriteItems.remove(widget.title);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
