import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(Calenders());
}

class Calenders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Calendar',style: TextStyle(fontFamily: 'Schyler',fontSize: 20,color: Colors.red),),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay:_focusedDay , 
            firstDay:DateTime.utc(2001,7,13),
             lastDay: DateTime.utc(2050 ,7, 10),
             calendarFormat:_calendarFormat,
             selectedDayPredicate: (day) {
               return isSameDay(_selectedDay, day);
             },

              // headerStyle:const HeaderStyle(
              //       formatButtonVisible: false,
              //       titleCentered: true,
              //       rightChevronIcon: Icon(
              //         Icons.chevron_right,
              //         size: 16,
              //         color: Colors.grey,
              //       ),
              //       leftChevronIcon: Icon(
              //         Icons.chevron_left,
              //         size: 16,
              //         color: Colors.grey,
              //       ),
              //     ),
             onDaySelected: (selectedDay, focusedDay){
              setState(() {
                _selectedDay= selectedDay;
                _focusedDay=focusedDay;
              });
             },
             onFormatChanged:(format) {
               if(_calendarFormat !=format){
                setState(() {
                  _calendarFormat =format;
                });
               }
             },
             onPageChanged: (focusedDay) {
               _focusedDay=focusedDay;
             },
             ),
        ],
      ),
      
    );
  }
}
