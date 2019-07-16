import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _expression;
  String _operator;
  double bil1, bil2;

  @override
  void initState() {

    _expression = "";
    _operator = "";
    bil1 = 0;
    bil2 = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String bil1String(){
      double dec = bil1 - bil1.floor();
      if(dec == 0){
        return bil1 == 0 ? "" : bil1.toStringAsFixed(0);
      }
      return bil1 == 0 ? "" : bil1.toString();
    }

    Widget _calcStatement(){
      return Container(
        color: Colors.grey.withOpacity(0.3),
        height: MediaQuery.of(context).size.height * (1/3),
        child: Align(
          alignment: Alignment(0.9, 0.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(bil1String(), style: TextStyle(fontSize: 32),),
              Text(_operator, style: TextStyle(fontSize: 32),),
              Text(_expression, style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      );
    }

    Widget _calcPadItem({Widget child, GestureTapCallback tap, GestureLongPressCallback longPress}){
      return Material(
        child: InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width * (1/4),
            height: 80.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3))
            ),
            child: Center(
              child: child,
            ),
          ),
          onTap: tap,
          onLongPress: longPress,
        ),
      );
    }

    void setExpression(String exp){
      setState(() {
        _expression += exp;
      });
    }

    void onOperationTapped(String opr){
      setState(() {
        _operator = opr;
        bil1 = double.parse(_expression);
        _expression = "";
      });
    }

    void additional(){
      _expression = (bil1 + bil2).toString();
      setState(() {
        bil1 = 0;
        bil2 = 0;
        _operator =  " ";
      });
    }

    void substraction(){
      _expression = (bil1 - bil2).toString();
      setState(() {
        bil1 = 0;
        bil2 = 0;
        _operator =  " ";
      });
    }

    void multiplication(){
      _expression = (bil1 * bil2).toString();
      setState(() {
        bil1 = 0;
        bil2 = 0;
        _operator =  " ";
      });
    }

    void divided(){
      _expression = (bil1 / bil2).toString();
      setState(() {
        bil1 = 0;
        bil2 = 0;
        _operator =  " ";
      });
    }

    void modulus(){
      _expression = (bil1 % bil2).toString();
      setState(() {
        bil1 = 0;
        bil2 = 0;
        _operator =  " ";
      });
    }

    void aritmethicOperation(){
      setState(() {
        bil2 = double.parse(_expression);
      });
      switch(_operator.toLowerCase()){
        case "+":
          additional();
          break;
        case "-":
          substraction();
          break;
        case "x":
          multiplication();
          break;
        case "/":
          divided();
          break;
        case "%":
          modulus();
          break;

      }
    }

    Widget _calcPads(){
      return Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          _calcPadItem(
            child: Text("AC",style: TextStyle(fontSize: 30,color: Colors.deepOrange),),
              tap: (){
                setState(() {
                  _expression = " ";
                  _operator = " ";
                  bil1 = 0;
                  bil2 = 0;
                });
              }
              ),
          _calcPadItem(
              child: Icon(Icons.arrow_back),
              tap: (){
                setState(() {
                  _expression = _expression.substring(0,_expression.length - 1);
                });
              },
            longPress: (){
              setState(() {
                _expression = " ";
              });

            }
          ),
          _calcPadItem(
              child: Text("%",style: TextStyle(fontSize: 30),),
              tap: (){
                onOperationTapped("%");
              }
          ),
          _calcPadItem(
              child: Text("/",style: TextStyle(fontSize: 30),),
              tap: (){
                onOperationTapped("/");
              }
          ),
          _calcPadItem(
              child: Text("7",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("7");
              }
          ),
          _calcPadItem(
              child: Text("8",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("8");
              }
          ),
          _calcPadItem(
              child: Text("9",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("9");
              }
          ),
          _calcPadItem(
              child: Text("X",style: TextStyle(fontSize: 30),),
              tap: (){
                onOperationTapped("X");
              }
          ),
          _calcPadItem(
              child: Text("4",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("4");
              }
          ),
          _calcPadItem(
              child: Text("5",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("5");
              }
          ),
          _calcPadItem(
              child: Text("6",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("6");
              }
          ),
          _calcPadItem(
              child: Text("-",style: TextStyle(fontSize: 30),),
              tap: (){
                onOperationTapped("-");
              }
          ),
          _calcPadItem(
              child: Text("1",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("1");
              }
          ),
          _calcPadItem(
              child: Text("2",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("2");
              }
          ),
          _calcPadItem(
              child: Text("3",style: TextStyle(fontSize: 30),),
              tap: (){
                setExpression("3");
              }
          ),
          _calcPadItem(
              child: Text("+",style: TextStyle(fontSize: 30),),
              tap: (){
                onOperationTapped("+");
              }
          ),
          _calcPadItem(
              child: Text(" ",style: TextStyle(fontSize: 30),),
              tap: (){}
          ),
          _calcPadItem(
              child: Text("0",style: TextStyle(fontSize: 30),),
              tap: (){
                setState(() {
                  _expression += "0";
                });
              }
          ),
          _calcPadItem(
              child: Text(".",style: TextStyle(fontSize: 30),),
              tap: (){
                setState(() {
                  _expression += ".";
                });
              }
          ),
          _calcPadItem(
              child: Text("=",style: TextStyle(fontSize: 30,color: Colors.deepOrange),),
              tap: (){
                aritmethicOperation();
              }
          ),

        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          _calcStatement(),
          _calcPads()
        ],
      ),
    );
  }
}
