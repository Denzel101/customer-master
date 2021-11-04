import 'package:flutter/material.dart';
import '../../utils/variables.dart';
import '../../widgets/neumorphism/neumorphism.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
            child: SizedBox(
              height: 100.0,
              child: NeumorphicContainer(
                child: Row(
                  children: <Widget>[
                    ClipRRect(borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        'https://picsum.photos/200',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: appPaddingValue),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Marvin Towett',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),

                            Text(
                                'Software',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black87
                              ),
                            ),
                            Text(
                                'Kes. 2,000/=',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black87
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ),
        Padding(
        padding: EdgeInsets.only(right: 24),
          child: SizedBox(
            child: Icon(
              Icons.close
            ),
          ),
        )
      ],
    );
  }
}
