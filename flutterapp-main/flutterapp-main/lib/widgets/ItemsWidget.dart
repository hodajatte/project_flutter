import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final Function(String) addToCart;

  const ItemsWidget({required this.addToCart});

  Widget buildItemWidget(BuildContext context, int index) {
    String itemName = "Product"; // Nom de l'article (peut être remplacé par une liste d'articles)
    double itemPrice = 20.0; // Prix de l'article (peut être remplacé par une liste de prix)
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "itemPage");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                "images/$index.jpg",
                height: 110,
                width: 110,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Item title",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF555555),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                itemName, // Utilisation du nom de l'article défini précédemment
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF555555),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$itemPrice", // Utilisation du prix de l'article défini précédemment
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF00A368),
                  ),
                ),
                InkWell(
                  onTap: () {
  addToCart(" Name Product : $itemName "  """"""""""""""""""""""""""""""""""""""     " Price : \$$itemPrice"); // Adding item to the cart with its name and price
},

                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A368),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF00A368),
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          shrinkWrap: true,
          children: [
            for (int i = 1; i < 8; i++)
              buildItemWidget(context, i), // Passer le contexte à la méthode de construction de l'article
          ],
        ),
      ],
    );
  }
}
