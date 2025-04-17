import 'package:flutter/material.dart';
import 'package:flutter_next_evel/presentation/ressourses/assets_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/color_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/styles_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/values_manager.dart';
import 'package:lottie/lottie.dart';

enum StateRandererType {
  //POPUP STATES (DIALOG)

  popupLoadingstate, 
  popupErrorstate,

  //FULL SCREEN STATES (FULL SCREEN)

  fullScreenloadingstate,
  fullScreenerrorstate,
  fullScreenemptystate,

  //general
  contentState,
}

class StateRanderer extends StatelessWidget{


  StateRandererType stateRandererType;
  String message;
  String title;
  Function retryActionFunction;

  StateRanderer({
    required this.stateRandererType,
    this.message = AppString.loading,
    this.title = AppString.empty,
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRandererType) {
      // Add cases here for different StateRandererType values
      case StateRandererType.popupErrorstate:
        _getDialog(context,[
          _getanimateImg(JsonAssets.erroreanimation),
          _getmessage(message),
          _getbuttonreload(AppString.ok, context)
        ]);
        break;
      case StateRandererType.popupLoadingstate:
        _getDialog(context,[
          _getanimateImg(JsonAssets.loadinganimation),
          _getmessage(message),
          _getbuttonreload(AppString.ok, context)
        ]);
      case StateRandererType.fullScreenloadingstate:
        _getItemcolumn([
          _getanimateImg(JsonAssets.loadinganimation),
          _getmessage(message),
        ]);
      case StateRandererType.fullScreenerrorstate:
         _getItemcolumn([
          _getanimateImg(JsonAssets.erroreanimation),
          _getmessage(message),
          _getbuttonreload(AppString.reload,context),
        ]);
      case StateRandererType.fullScreenemptystate:
         _getItemcolumn([
          _getanimateImg(JsonAssets.loadinganimation),
          _getmessage(message),
        ]);
      case StateRandererType.contentState:
        return Container(); // Return a default widget
      default:
        return Container(); // Return a default widget
    }
    return Container(); // Return a default widget if no case matches
  }


  Widget _getDialog(BuildContext context,List<Widget> children){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PaddingManger.p12)),
      elevation: PaddingSize.s16,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(PaddingManger.p12),
          shape: BoxShape.rectangle,
        
        ),
        child: _getDialogcontext(context,children),
      ),
    );
  }

  Widget _getDialogcontext(BuildContext context,List<Widget> children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemcolumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getanimateImg(String animateimg){
    return Container(
      width: Appsize.a100,
      height: Appsize.a100,
      child: Lottie.asset(
        animateimg
      ),
    );
  }

  Widget _getmessage(String message) {
    return Text(message,style: getTextStyleTitle(Appsize.a16, FontWeight.bold, Colors.black12),);
  }

  _getbuttonreload(String titlebtn,BuildContext context){
    return GestureDetector(
      onTap: (){
        if(stateRandererType == StateRandererType.fullScreenerrorstate){
          retryActionFunction.call();
        }
        else{
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width:double.infinity,
        height: Appsize.a100,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(PaddingManger.p12),
        ),
        child: Text(titlebtn),
      )
    );
  }

}