import 'package:flutter/material.dart';
import 'package:proj1/Models/CartData.dart';

class ProductL extends StatelessWidget {
  final CardData cd;
  const ProductL({super.key, required this.cd});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      // height: height,
      // width: width * 0.010,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      // height: height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://api.kutir.store/api/v1/upload/productsImage/${cd.image}',
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: height * 0.25,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star),
                      Text("3.5"),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cd.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          cd.label,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("₹${cd.price}")
                      ],
                    ),
                  ),
                  Icon(Icons.favorite_outline)
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
