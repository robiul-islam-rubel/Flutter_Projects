import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex=0;
  final List<String> categories=['Messages','Online','Groups','Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context,int index)
          {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex=index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child:  Text(
                  categories[index],
                  style: TextStyle(
                      color: index==selectedIndex? Colors.white:Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),),


              ),
            );
          }
      ),
    );
  }
}
