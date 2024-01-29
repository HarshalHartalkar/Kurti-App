import 'package:flutter/material.dart';
import 'package:proj1/Models/ProductPageData.dart';
import 'package:proj1/Services/ProductScreenAPI.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductPageData pd;
  bool isLoading = false;
  List<String> sizeList = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
  ];
  List<String> detailsList = [
    "Lorem ipsum dolor s"
        'Lore: dolor sit amet'
        'Lorem ipsum dolor'
        'Lorem ipsum doloet'
        'Lorem ipsum dolomet'
        'Lorem ipsum dolor'
        'Lorem ipsum doloet'
  ];
  // late ProductPageData productPageData;
  @override
  void initState() {
    // TODO: implement initState
    getProductData();
    super.initState();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white54,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            // height: height * 0.07,
            // width: width * 0.11,
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.house_outlined)),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            // height: height * 0.07,
            // width: width * 0.11,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            // height: height * 0.07,
            // width: width * 0.11,
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    // alignment: Alignment.topCenter,
                    height: height * 0.75,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://api.kutir.store/api/v1/upload/productsImage/${pd.image}"),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: height * 0.040,
                          left: width * 0.040,
                          child: Container(
                            // margin: EdgeInsets.symmetric(
                            //   vertical: height * 0.5,
                            //   horizontal: width * 0.05,
                            // ),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Icon(
                                //   Icons.star,
                                //   // size: 18,
                                // ),
                                Icon(Icons.star),
                                SizedBox(
                                  width: 5,
                                ),
                                // Text(
                                //   "3.5",
                                //   style: TextStyle(
                                //     fontSize: 18,
                                //     color: Colors.black,
                                //   ),
                                // ),
                                Text('4.5'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pd.title,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  pd.label,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Icon(Icons.favorite_outline)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '₹ ${pd.mrp}',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Text(
                              '₹ ${pd.price}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Text('${pd.discount}% off'),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Text(
                          "Inclusive of all Taxes",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Color(0xFF5E8715)),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Selected Size: XS",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                bottom: 3,
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Color(0xFF386019),
                                width:
                                    1.3, // This would be the width of the underline
                              ))),
                              child: Text(
                                "Size Chart",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  // decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var size in sizeList)
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFF718E42)),
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF5F8F7)),
                                child: Text(
                                  size,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.050,
                        ),
                        Text(
                          "Delivery and Services",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.5,
                              height: height * 0.065,
                              child: TextField(
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  label: Text("Enter Pincode"),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Verify",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                    (states) => Color(0xFF386019),
                                  ),
                                  shape: MaterialStateProperty.resolveWith(
                                      (states) => RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.050,
                        ),
                        Text("Product Details"),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        // for (var element in detailsList) Text(element),
                        HtmlWidget(pd.description),
                        SizedBox(
                          height: height * 0.025,
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         padding: EdgeInsets.all(15),
                  //         color: Color(0xFF688D2D),
                  //         // height: height * 0.10,
                  //         // width: width,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(
                  //               Icons.shopping_bag_outlined,
                  //               color: Colors.white,
                  //             ),
                  //             Text(
                  //               " Add To Bag",
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         padding: EdgeInsets.all(15),
                  //         color: Color(0xFFF9FFF4),

                  //         // alignment: Alignment.center,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(Icons.favorite_border_outlined),
                  //             Text(" Wishlist"),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: EdgeInsets.all(15),
              color: Color(0xFF688D2D),
              // height: height * 0.10,
              // width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    " Add To Bag",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: EdgeInsets.all(15),
              color: Color(0xFFF9FFF4),

              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border_outlined),
                  Text(" Wishlist"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getProductData() async {
    setState(() {
      isLoading = true;
    });
    pd = (await fetchProductData(
      widget.productId,
    ));
    setState(() {
      isLoading = false;
    });
  }
}
