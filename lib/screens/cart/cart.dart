import 'package:flutter/material.dart';
import 'package:service_pap/screens/cart/cart_item.dart';
import 'package:service_pap/widgets/custom_app_bar_back.dart';
import '../../utils/variables.dart';
import '../../widgets/neumorphism/neumorphism.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double screenHeight;

  _getSize(double percentage) {
    // print("ScreenHeight: $screenHeight");
    return percentage / 100 * screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CustomAppBarBack(title: 'Cart'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[

              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: _getSize(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                        child: Text(
                          'Cart',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: _getSize(5)),

                      Container(
                        height: 280.0,
                        child: CartItem(),
                      )
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                              child: Text(
                                'Estimate of:',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                              child: Text(
                                'Kes. 6,000/Hr',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                              child: NeumorphicButton(
                                style: NeumorphicStyle(color: Colors.black87),
                                child: Icon(
                                  Icons.credit_card,
                                  color: Colors.white,
                                ),
                                onTap: (){
                                  Navigator.pushNamed(context, 'home');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
