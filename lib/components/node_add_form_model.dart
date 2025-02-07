import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'node_add_form_widget.dart' show NodeAddFormWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NodeAddFormModel extends FlutterFlowModel<NodeAddFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for titleInput widget.
  FocusNode? titleInputFocusNode;
  TextEditingController? titleInputTextController;
  String? Function(BuildContext, String?)? titleInputTextControllerValidator;
  String? _titleInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title is required';
    }

    return null;
  }

  // State field(s) for descriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputTextController;
  String? Function(BuildContext, String?)?
      descriptionInputTextControllerValidator;
  String? _descriptionInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    return null;
  }

  // State field(s) for widthInput widget.
  FocusNode? widthInputFocusNode;
  TextEditingController? widthInputTextController;
  String? Function(BuildContext, String?)? widthInputTextControllerValidator;
  String? _widthInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Width is required';
    }

    return null;
  }

  // State field(s) for heightInput widget.
  FocusNode? heightInputFocusNode;
  TextEditingController? heightInputTextController;
  String? Function(BuildContext, String?)? heightInputTextControllerValidator;
  String? _heightInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Height is required';
    }

    return null;
  }

  // State field(s) for numberOfInputs widget.
  FocusNode? numberOfInputsFocusNode;
  TextEditingController? numberOfInputsTextController;
  String? Function(BuildContext, String?)?
      numberOfInputsTextControllerValidator;
  String? _numberOfInputsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Number is required';
    }

    return null;
  }

  // State field(s) for numberOfOutputs widget.
  FocusNode? numberOfOutputsFocusNode;
  TextEditingController? numberOfOutputsTextController;
  String? Function(BuildContext, String?)?
      numberOfOutputsTextControllerValidator;
  String? _numberOfOutputsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Number is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    titleInputTextControllerValidator = _titleInputTextControllerValidator;
    descriptionInputTextControllerValidator =
        _descriptionInputTextControllerValidator;
    widthInputTextControllerValidator = _widthInputTextControllerValidator;
    heightInputTextControllerValidator = _heightInputTextControllerValidator;
    numberOfInputsTextControllerValidator =
        _numberOfInputsTextControllerValidator;
    numberOfOutputsTextControllerValidator =
        _numberOfOutputsTextControllerValidator;
  }

  @override
  void dispose() {
    titleInputFocusNode?.dispose();
    titleInputTextController?.dispose();

    descriptionInputFocusNode?.dispose();
    descriptionInputTextController?.dispose();

    widthInputFocusNode?.dispose();
    widthInputTextController?.dispose();

    heightInputFocusNode?.dispose();
    heightInputTextController?.dispose();

    numberOfInputsFocusNode?.dispose();
    numberOfInputsTextController?.dispose();

    numberOfOutputsFocusNode?.dispose();
    numberOfOutputsTextController?.dispose();
  }
}
