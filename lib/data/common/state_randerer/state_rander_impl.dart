import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_next_evel/app/constant.dart';
import 'package:flutter_next_evel/data/common/state_randerer/state_randerer.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';

abstract class FlowState {
  StateRandererType getStateRandererType();

  String getMessage();
}

// Loading state class
class LoadingState extends FlowState {
  StateRandererType stateRandererType;
  String? message;

  LoadingState({
    required this.stateRandererType,
    this.message = AppString.loading,
  });

  @override
  String getMessage() => message ?? AppString.loading;

  @override
  StateRandererType getStateRandererType() => stateRandererType;
}
// Error state class

class ErroreState extends FlowState {
  StateRandererType stateRandererType;
  String? message;

  ErroreState({
    required this.stateRandererType,
    this.message = AppString.loading,
  });

  @override
  String getMessage() => message ?? AppString.loading;

  @override
  StateRandererType getStateRandererType() => stateRandererType;
}

// content state class
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constant.empty;

  @override
  StateRandererType getStateRandererType() => StateRandererType.contentState;
}

// Empty state class
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  String getMessage() => message ?? AppString.loading;

  @override
  StateRandererType getStateRandererType() =>
      StateRandererType.fullScreenemptystate;
}

extension FlowStateExtemnsio on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRandererType() == StateRandererType.popupLoadingstate) {
            //show loading then
            showpopup(context, getStateRandererType(), getMessage());
            return contentScreenWidget;
            // show content screen
          } else {
            StateRanderer(
                stateRandererType: getStateRandererType(),
                message: getMessage(),
                retryActionFunction: () {
                  retryActionFunction();
                });
          }
        }
      case ErroreState:
        {
          if (getStateRandererType() == StateRandererType.popupLoadingstate) {
            //show loading then
            showpopup(context, getStateRandererType(), getMessage());
            return contentScreenWidget;
            // show content screen
          } else {
            StateRanderer(
                stateRandererType: getStateRandererType(),
                message: getMessage(),
                retryActionFunction: () {
                  retryActionFunction();
                });
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRanderer(
              stateRandererType: getStateRandererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
    throw Exception("Unhandled FlowState type: ${runtimeType.toString()}");
  }
}

isCurrentDialogShowingn(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context) {
  if (isCurrentDialogShowingn(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

showpopup(
    BuildContext context, StateRandererType stateRandererType, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) => StateRanderer(
          stateRandererType: stateRandererType,
          message: message,
          retryActionFunction: () {}));
}
