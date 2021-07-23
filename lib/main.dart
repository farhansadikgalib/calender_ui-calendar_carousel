import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter calendar',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Calendar'),
    );
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime(2021, 7));
  DateTime _targetDateTime = DateTime(2021, 07, 22);


  late CalendarCarousel _calendarCarouselNoHeader;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,

      weekendTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),
      thisMonthDayBorderColor: Colors.grey,
      prevMonthDayBorderColor: Colors.grey,
      nextMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 375.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      showHeader: false,
      showIconBehindDayText: true,
      weekdayTextStyle: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      //
      // minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      // maxSelectedDate: _currentDate.add(Duration(days: 360)),

     inactiveDaysTextStyle: GoogleFonts.nunito(
       fontSize: 18,
       fontWeight: FontWeight.w900,
       color: Color.fromRGBO(12, 40, 96,1),
       letterSpacing: 1,
     ),
      daysTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),
      prevDaysTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),




    nextDaysTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),

      inactiveWeekendTextStyle: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),
      selectedDayBorderColor: Colors.black,
      selectedDayButtonColor: Colors.blue,


      todayTextStyle:GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(12, 40, 96,1),
        letterSpacing: 1,
      ),

      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },

    );

    return Scaffold(

        body: SafeArea(

          child: Column(
            children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
              child: Column(
                    children: [


                  Card(
                      color: Color.fromRGBO(12, 40, 96,1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),

                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text('BACK',style:GoogleFonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white54,
                                  letterSpacing: 1,
                                ),
                          ),
                                onPressed: () {
                                  setState(() {
                                    _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
                                    _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                                  });
                                },
                              ),

                              Text(
                                _currentMonth,
                                style: GoogleFonts.nunito(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                              FlatButton(
                                child: Text('NEXT',style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white54,
                                  letterSpacing: 1,
                                ),),
                                onPressed: () {
                                  setState(() {
                                    _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
                                    _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                                  });
                                },
                              )
                            ],
                          ),
                  ),
                   //   ),
                     // Card(
                        // elevation: 10,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.only(
                        //       bottomRight: Radius.circular(20),
                        //       bottomLeft: Radius.circular(20)),
                        //        ),
                       // child:

                        Container(child: _calendarCarouselNoHeader),
                     // ), //

                    ],
                  ),
                ),
            ],
          ),
          ),
    );
  }
}


