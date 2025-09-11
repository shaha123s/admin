import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'adduserr_widget.dart' show AdduserrWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdduserrModel extends FlutterFlowModel<AdduserrWidget> {
  ///  Local state fields for this page.

  String? user;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for virefypassword widget.
  FocusNode? virefypasswordFocusNode;
  TextEditingController? virefypasswordTextController;
  late bool virefypasswordVisibility;
  String? Function(BuildContext, String?)?
      virefypasswordTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask2;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? usrRow;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    virefypasswordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    virefypasswordFocusNode?.dispose();
    virefypasswordTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
