import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {

  DateTime _startDate;
  DateTime _endDate;
  int _indexTapped;

  @override
  Widget build(BuildContext context) {

    final _screnSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBody(context, _screnSize),
    );
  }

  Widget _buildBody(BuildContext context, Size size) {

    return Center(
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff069fd6),
        ),
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: _buildContent(context, size),
        )
      ),
    );
  }

  Widget _buildContent(BuildContext context, Size size) {

    return Container(
      //color: Colors.green,
      padding: EdgeInsets.only(
        top: 60.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          _buildContentHeader(context, size),
          SizedBox(height: 10.0,),

          _buildContentFilterButton(context, size),
          SizedBox(height: 25.0,),

          _buildContentOptions(size),

        ],

      ),
    );
  }

  Widget _buildContentHeader(BuildContext context, Size size) {

    return Container(
      height: size.height * 0.2,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _builTextBox(
            size: size,
            text: ( _startDate == null) ? 'Fecha Inicial' : _formatDate(_startDate) ,
            wichDate: 'start'
          ),

          _builTextBox(
            size: size,
            text: (_endDate == null ) ? 'Fecha Final' : _formatDate(_endDate),
            wichDate: 'end'
          ),

        ],
      ),
    );
  }

  Widget _builTextBox({ Size size, String text, String wichDate }) {

    final boxTextStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.0);

    return GestureDetector(
      onTap: () => _showDatepicker(context, wichDate),
      child: Container(
        width: size.width * 0.6,
        height: 60,
        padding: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          )
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: boxTextStyle),
        ),
      ),
    );
  }

  Widget _buildContentFilterButton(BuildContext context, Size size) {

    final boxTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0);

    return GestureDetector(
      onTap: () => _close(context),
      child: Container(
        width: size.width * 0.6,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff0046eb),
              Color(0xff069fd6),
              //Colors.blue[600]
            ]
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text('Filtrar', style: boxTextStyle),
        ),
      ),
    );
  }

  Widget _buildContentOptions(Size size) {

    return Table(

      children: [

        _buildTableRow(
          textOne: 'Hoy',
          textTwo: 'Ayer',
          indexOne: 0,
          indexTwo: 1,
        ),

        _buildTableRow(
          textOne: 'Esta semana',
          textTwo: 'Última semana',
          indexOne: 2,
          indexTwo: 3,
        ),

        _buildTableRow(
          textOne: 'Este mes',
          textTwo: 'Último mes',
          indexOne: 4,
          indexTwo: 5,
        ),

        _buildTableRow(
          textOne: 'Este año',
          textTwo: 'Último año',
          indexOne: 6,
          indexTwo: 7,
        ),

      ],
    );
  }

  TableRow _buildTableRow({ String textOne, String textTwo, int indexOne, int indexTwo }) {

    return TableRow(

      children: <Widget>[

        _buildTableRowItem(text: textOne, index: indexOne),

        _buildTableRowItem(text: textTwo, index: indexTwo ),

      ],

    );

  }

  Widget _buildTableRowItem({ String text, int index }) {

    final boxTextStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0);

    return GestureDetector(
      onTap: () {
        print('index tapped -> $index');
        _indexTapped = ( _indexTapped == index ) ? null : index;
        setState(() {});
      },
      child: Container(
        height: 50.0,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        padding: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: ( _indexTapped == index ) ? Color(0xff0af5ca) : Colors.white
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: boxTextStyle,),
        ),
      ),
    );
  }

  Future<void> _showDatepicker(BuildContext context, String wichDate) {

    return showDatePicker(
      context: context,
      //initialDate: DateTime.now(),
      initialDate: ( _startDate != null) ? _startDate : DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now()
    ).then((date) {

      if (date != null) {
        _setDate(date: date, wichDate: wichDate);        
      }

    });

  }

  void _setDate({DateTime date, String wichDate}) {

    if ( wichDate == 'start' ) {
      _startDate = date;
    } else {
      _endDate = date;
    }

    setState(() {});
  }

  String _formatDate(DateTime date) {

    final _date = date.toString().split(' ')[0].split('-');
    final newDate = '${_date[2]}/${_date[1]}/${_date[0]}';

    return newDate;
  }

  void _close(BuildContext context) {

    print('The dates to send to the service __________');
    print('startDate -> $_startDate');
    print('endDate -> $_endDate');

    Navigator.pop(context);
  }

} 

class BackgroundPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Color(0xff0af5ca)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.1, size.height * 0.3, size.width * 0.25, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.3, size.width * 0.5, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.1, size.width * 0.85, size.height * 0.15)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.15, size.width, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.04)
      ..quadraticBezierTo(size.width, 0, size.width * 0.9, 0)
      ..lineTo(size.width * 0.1, 0)
      ..quadraticBezierTo(0, 0, 0, size.height * 0.04)
      ..close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

}