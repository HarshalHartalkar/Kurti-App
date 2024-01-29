import 'package:flutter/material.dart';
import 'package:proj1/Models/CartData.dart';
import 'package:proj1/Services/Productdata.dart';
import 'package:proj1/Widgets/ProductCard.dart';
import 'package:proj1/Widgets/ProductPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CardData> cardDataList = [];
  bool isDataLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    getAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text("Kurta Sets",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )),
        backgroundColor: Color(0xFF688D2D),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: isDataLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.63),
              itemCount: cardDataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage(productId: cardDataList[index].id)));
                  },
                  child: ProductL(
                    cd: cardDataList[index],
                  ),
                );
              }),
    );
  }

  void getAPIData() async {
    setState(() {
      isDataLoading = true;
    });

    cardDataList = await fetchData();

    setState(() {
      isDataLoading = false;
    });
  }
}
