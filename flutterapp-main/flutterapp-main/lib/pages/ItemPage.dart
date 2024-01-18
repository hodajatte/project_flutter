import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerapp/widgets/BottomBar.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int quantity = 1;
  double initialPrice = 20.0; // Prix initial
  double totalPrice =  20;// Prix total basé sur la quantité

  void increaseQuantity() {
    setState(() {
      quantity++;
      totalPrice = initialPrice * quantity; // Mettre à jour le prix total en fonction de la quantité
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        totalPrice= initialPrice * quantity; // Mettre à jour le prix total en fonction de la quantité
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Votre code existant...

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: decreaseQuantity,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 24, 0, 163),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        CupertinoIcons.minus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: increaseQuantity,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 24, 163),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              // Affichage du prix total en fonction de la quantité
              Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // Votre code existant...
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(totalPrice: totalPrice), // Envoyer totalPrice au BottomBar
    );
  }
}
