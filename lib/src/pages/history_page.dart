import 'package:cashcontrol/src/widgets/filter_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff970cf7),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        top: 70.0
      ),
      width: _screenSize.width,
      child: Column(

        children: [

          _buildColumnHeader(),

          _buildColumnContent(_screenSize),

        ],

      ),
    );
  }

  Widget _buildColumnHeader() {

    return Row(
      children: [

        IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),

        Expanded(child: Text('Historial', style: TextStyle(color: Colors.black, fontSize: 18.0), textAlign: TextAlign.center,)),

      ],
    );

  }

  Widget _buildColumnContent(Size size) {

    return Container(
      width: size.width,
      margin: EdgeInsets.only(
        top: 20.0
      ),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        )
      ),
      child: Column(

        children: [

          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: Colors.black,),
                onPressed: () => {},
              ),

              GestureDetector(
                child: Expanded(
                  child: Text('26 feb 2021 - 01 mar.2021', style: TextStyle(color: Colors.black, fontSize: 18.0),)
                ),
                onTap: () => _openFilterWidget(context),
              ),

              IconButton(
                icon: Icon(Icons.arrow_forward_rounded, color: Colors.black,),
                onPressed: () => {},
              ),

            ],

          ),

        ],

      ),
    );
  }

  void _openFilterWidget(BuildContext context) {

    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Color(0xff069fd6).withOpacity(0.4),
        transitionDuration: Duration(milliseconds: 400),
        reverseTransitionDuration: Duration(milliseconds: 200),
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {

          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );

        },
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
          return FilterWidget();
        }
      )
    );
  }
}