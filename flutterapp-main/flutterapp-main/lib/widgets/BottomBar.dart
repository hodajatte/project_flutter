import 'package:flutter/material.dart';

class CartItem {
  final String itemName;
   final double totalPrice;

  CartItem({required this.itemName, required this.totalPrice});
}

class BottomBar extends StatefulWidget {
  final double totalPrice;

  const BottomBar({Key? key, required this.totalPrice}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<CartItem> cartItems = [];

  void addToCart() {
    // Ajouter un nouvel élément au panier
    CartItem newItem = CartItem(itemName: "Example Item", totalPrice: widget.totalPrice);
    setState(() {
      cartItems.add(newItem);
    });

    // Afficher un message pour confirmer l'ajout au panier
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item added to cart!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '\$${widget.totalPrice}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00A368),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            InkWell(
              
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF00A368),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
