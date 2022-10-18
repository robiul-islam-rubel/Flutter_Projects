import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvc/model/Model.dart';

class Controller extends ControllerMVC
{
  static  Controller _this = new Controller();

  int get counter => Model.counter;
  void inC() {
    /// The Controller knows how to 'talk to' the Model. It knows the name, but Model does the work.
    //Model.incrementCounter();
    Model.incrementCounter();

  }

  void decC() {
    /// The Controller knows how to 'talk to' the Model. It knows the name, but Model does the work.
    Model.decrementCounter();
  }
}