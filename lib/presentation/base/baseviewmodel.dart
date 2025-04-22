import 'dart:async';

import 'package:flutter_next_evel/data/common/state_randerer/state_rander_impl.dart';

abstract class Baseviewmodel implements BaseviewmodelInputs , BaseviewmodelOutputs{

  StreamController<FlowState> inpetStrweamContrroler = StreamController<FlowState>.broadcast();
  //shared functions and variables that will be used in all view

  //dispose function

  @override
  void dispose() {
    // super.dispose();
    inpetStrweamContrroler.close();
  }

  @override
  Sink get inputState => inpetStrweamContrroler.sink;

  @override
  Stream<FlowState> get outputState => inpetStrweamContrroler.stream.map((flowState) => flowState);

}

abstract class BaseviewmodelInputs{ 
  void start(); // start view model job
  void dispose();// dispose view model job

  Sink get inputState; // input stream
}

abstract class BaseviewmodelOutputs{
  // implemenet later
  Stream<FlowState> get outputState; // output stream
}


