import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:grocerapp/widgets/CategoriesWidget.dart';
import 'package:grocerapp/widgets/DrawerWidget.dart';
import 'package:grocerapp/widgets/ItemsWidget.dart';
import 'package:grocerapp/widgets/PopularItemsWidget.dart';


class CartPage extends StatefulWidget {
  final List<String> cartItems;
  final Function(int) removeFromCart;

  CartPage({required this.cartItems, required this.removeFromCart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Define a fixed price per item
  double itemPrice = 20; // Replace this with your actual item price

  // Function to calculate the total price
  double calculateTotalPrice() {
    return widget.cartItems.length * itemPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0), // Added padding for left and right
            child: Align(
              alignment: Alignment.centerRight, // Aligning the total price text to the right
              child: Text(
                'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(widget.cartItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      widget.removeFromCart(index);
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ElevatedButton(
  onPressed: () {
    // Add PayPal payment logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Redirecting to PayPal for payment...'),
        duration: Duration(seconds: 2),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 12), // Ajustement de l'espacement vertical du bouton
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Bord arrondi du bouton
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.payment), // Icône à gauche du texte du bouton
      SizedBox(width: 8), // Espacement entre l'icône et le texte
      Text(
        'Pay with PayPal',
        style: TextStyle(fontSize: 16), // Ajustement de la taille du texte
      ),
    ],
  ),
)

        ],
      ),
    );
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> cartItems = [];

  void addToCart(String item) {
    setState(() {
      cartItems.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$item added to cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromARGB(255, 11, 0, 163),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 3, 0, 163),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: badges.Badge(
                        position: badges.BadgePosition.topEnd(),
                        badgeContent: Text(
                          cartItems.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPage(
                                  cartItems: cartItems,
                                  removeFromCart: removeFromCart,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(7),
                            child: Icon(
                              CupertinoIcons.cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "What do you want to buy?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search here...",
                            border: InputBorder.none),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    PopularItemsWidget(
                      addToCart: addToCart,
                    ),
                    ItemsWidget(
                      addToCart: addToCart,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
