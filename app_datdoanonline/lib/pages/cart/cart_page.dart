import 'package:app_datdoanonline/pages/cart/order_history_page.dart';
import 'package:flutter/material.dart';

class ItemInCart {
  final String nameProduct;
  final String imageProduct;
  final double priceProduct;
  int quantity;

  ItemInCart({
    required this.nameProduct,
    required this.imageProduct,
    required this.priceProduct,
    this.quantity = 1,
  });
}

class ShoppingCartProvider {
  final List<ItemInCart> _items = [];

  List<ItemInCart> get items => _items;

  void addItem(ItemInCart item) {
    final index = _items.indexWhere((existingItem) => existingItem.nameProduct == item.nameProduct);
    if (index != -1) {
      _items[index].quantity += 1;
    } else {
      _items.add(item);
    }
  }

  void removeItem(ItemInCart item) {
    _items.removeWhere((existingItem) => existingItem.nameProduct == item.nameProduct);
  }

  void decreaseItemQuantity(ItemInCart item) {
    final index = _items.indexWhere((existingItem) => existingItem.nameProduct == item.nameProduct);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index].quantity -= 1;
    } else {
      removeItem(item);
    }
  }

  double getTotal() {
    return _items.fold(0, (total, item) => total + (item.priceProduct * item.quantity));
  }

  int getTotalQuantity() {
    return _items.fold(0, (total, item) => total + item.quantity);
  }

  void clearCart() {
    _items.clear();
  }
}

final ShoppingCartProvider spc = ShoppingCartProvider();

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.pink[200],
  centerTitle: true,
  title: const Text(
    "Giỏ hàng",
    style: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.history),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderHistoryPage()),
        );
      },
    ),
    IconButton(
      onPressed: () {
        setState(() {
          spc.clearCart();
        });
      },
      icon: const Icon(Icons.delete),
    ),
  ],
),

      body: Column(
        children: [
          spc.items.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      "Giỏ hàng trống",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: spc.items.length,
                    itemBuilder: (context, index) {
                      final item = spc.items[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            item.imageProduct,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(item.nameProduct),
                          subtitle: Text("Price: ${item.priceProduct.toStringAsFixed(0)} VNĐ x ${item.quantity}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    spc.decreaseItemQuantity(item);
                                  });
                                },
                              ),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    spc.addItem(item);
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    spc.removeItem(item);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tổng cộng:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${spc.getTotal().toStringAsFixed(0)} VNĐ", style: const TextStyle(fontSize: 18)),

              ],
            ),
          ),
          GestureDetector(
  onTap: () {
  setState(() {
    // Lưu thông tin đơn hàng vào lịch sử
    orderHistory.addOrder(List.from(spc.items), spc.getTotal());
    spc.clearCart(); // Xóa giỏ hàng
  });

  // Hiển thị thông báo
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.pink[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(
            "Thanh toán thành công!",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );

  // Đóng thông báo sau 2 giây
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pop();
  });
},

  child: Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(vertical: 15),
    color: Colors.pink[200],
    child: const Text(
      "Thanh toán",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  ),
),



        ],
      ),
    );
  }
}
