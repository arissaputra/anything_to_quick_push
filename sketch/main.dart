import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zketch_new/line_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main(){
  runApp(new MaterialApp(
    title: 'Progress Report',
    home: new HomePage(),
    routes: <String, WidgetBuilder>{
      '/HomePage' : (BuildContext context) => new HomePage(),
      '/ProgressReport' : (BuildContext context) => new ProgressReport(),
      '/Cuk' : (BuildContext context) => new MyLineChart(),
    },
  ));
}

class HomePage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, size: 50.0,),
            onPressed: (){
              Navigator.pushNamed(context, '/ProgressReport');
            },
          ),
          IconButton(
            icon: Icon(Icons.show_chart, size: 50.0,),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) =>
                  new MyLineChart())
                );
            },
          ),
        ],)
         
      ),
    );
  }
}

class ProgressReport extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Progress Report"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          // Info Anak dan Psikolog
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
            // Anak
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text("Nama Anak", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.getInstance().setSp(14)))
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text("John Doe, 12 Tahun", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(14)),),
              ),
              
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text("Gangguan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.getInstance().setSp(14))),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text("Telat belajar membaca", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(14))),
              ),
              
            ],),

            // Psikolog
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text("Psychologist", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.getInstance().setSp(14)))
              ),
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text("Ivan Dwi Pujianto", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(14))),
              ),
              Row(children: <Widget>[
                Icon(Icons.message, size: 30.0,),
                Icon(Icons.phone, size: 30.0,),

              ],)
            ],)
          ],),

          // Grafik
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Center(child: Text("Development Graph"),),
          ),
          
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Center(child: Text('-- ada grafik disini nanti --'))
            
          ],),

          // Progress Note
          SizedBox(height: 25),
          Center(child: Text("Progress Note"),),
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(padding: EdgeInsets.all(10.0), 
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Therapy 1", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(14))),
                    ),
                    Row(children: <Widget>[
                      Container(
                        height: 5.0,
                        width: 5.0,
                        child: FittedBox(
                          child: FloatingActionButton(backgroundColor: Colors.red[300], onPressed: () {}),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Butuh terapi rutin", style: TextStyle(color: Colors.red[300], fontSize: ScreenUtil.getInstance().setSp(10))),
                      ),
                    ],)
                    
                  ],),
                  
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Anak terlihat gejala masih belum dilatih, ini bisa disebabkan karena beberapa faktor", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
                    child: Text("Saran", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Diperlukan terapi rutin, pantau anak dan lebih mendekati anak", style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12))),
                  ),
                  
                ]),
              )

            ),
          )
          
        ],),
      )
    );
  }
}


class MyLineChart extends StatefulWidget {
  @override
  _MyLineChartState createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  List<charts.Series<LinearSales,int>> _seriesLineData;
  _generateData(){
    var lineData1=[
      new LinearSales(0, 45),
      new LinearSales(1, 56),
      new LinearSales(2, 55),
      new LinearSales(3, 60),
      new LinearSales(4, 61),
      new LinearSales(5, 70),
    ];
    var lineData2=[
      new LinearSales(0, 35),
      new LinearSales(1, 46),
      new LinearSales(2, 45),
      new LinearSales(3, 50),
      new LinearSales(4, 51),
      new LinearSales(5, 60),
    ];

    _seriesLineData.add(
      charts.Series(
        data: lineData1,
        domainFn: (LinearSales line,_) => line.year,
        measureFn: (LinearSales line,_) => line.sales,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Linear Sales'
      )
    );
    _seriesLineData.add(
      charts.Series(
        data: lineData2,
        domainFn: (LinearSales line,_) => line.year,
        measureFn: (LinearSales line,_) => line.sales,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Linear Sales'
      )
    );
  }

  @override
  void initState(){
    super.initState();
    _seriesLineData = List<charts.Series<LinearSales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Grafik"),
      ),
      body: new Center(
        child: charts.LineChart(_seriesLineData, animate: true,)
      ),
    );
  }
}