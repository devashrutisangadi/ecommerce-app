import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderScreen extends StatefulWidget {
  final Order order;

  const OrderScreen({super.key, required this.order});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    int totalCount = widget.order.items.length;
    double totalAmount =
        widget.order.items.fold(0, (sum, product) => sum + product.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Color.fromARGB(255, 163, 104, 190),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Total Count'),
                    content: Text('Total Count: $totalCount'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Total Count: $totalCount'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Total Amount'),
                    content: Text('Total Amount: Rs. $totalAmount'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Total Amount: Rs. $totalAmount'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.order.items.length,
              itemBuilder: (context, index) {
                final product = widget.order.items[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Rs. ${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      widget.order.removeOrder(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Removed from Orders: ${product.name}')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}