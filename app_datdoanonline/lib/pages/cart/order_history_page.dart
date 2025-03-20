import 'package:app_datdoanonline/pages/cart/cart_page.dart';
import 'package:app_datdoanonline/widgets/big_text.dart';
import 'package:flutter/material.dart';

class Order {
  final List<ItemInCart> items;
  final double total;
  final DateTime dateTime;

  Order({
    required this.items,
    required this.total,
    required this.dateTime,
  });
}

class OrderHistory {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(List<ItemInCart> items, double total) {
    _orders.add(Order(
      items: items,
      total: total,
      dateTime: DateTime.now(),
    ));
  }
}

final OrderHistory orderHistory = OrderHistory();

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: BigText(
          text: "Lịch sử đơn hàng",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: orderHistory.orders.isEmpty
          ? const Center(
              child: Text(
                "Chưa có đơn hàng nào",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: orderHistory.orders.length,
              itemBuilder: (context, index) {
                final order = orderHistory.orders[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      "Tổng cộng: ${order.total.toStringAsFixed(0)} VNĐ",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Ngày: ${order.dateTime}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Chi tiết đơn hàng"),
                            content: SizedBox(
                              height: 200,
                              child: ListView(
                                children: order.items.map((item) {
                                  return ListTile(
                                    leading: Image.network(
                                      item.imageProduct,
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Text(item.nameProduct),
                                    subtitle: Text(
                                      "Giá: ${item.priceProduct.toStringAsFixed(0)} VNĐ x ${item.quantity}",
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
