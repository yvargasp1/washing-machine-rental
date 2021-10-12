import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/search_page.dart';
class ButtonAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        leading: GestureDetector(
          onTap: (){
             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions:<Widget> [
          Padding(padding:EdgeInsets.only(right: 20.0) ,
          child: GestureDetector(
            onTap:(){},
            child: Icon(
              Icons.search,
              color: Colors.black,
             
            ),
          ),
          ),
          Padding(padding:EdgeInsets.only(right: 20.0) ,
          child: GestureDetector(
            onTap:(){},
            child: Icon(
              Icons.history,
              color: Colors.black,
            
            ),
          ),
          
          )  


        ],
        
        
      ),
      
    );
    
  }
}
