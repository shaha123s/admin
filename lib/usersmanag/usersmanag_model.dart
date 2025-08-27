import '/backend/supabase/supabase.dart';
import '/components/switchh_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'usersmanag_widget.dart' show UsersmanagWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UsersmanagModel extends FlutterFlowModel<UsersmanagWidget> {
  ///  Local state fields for this page.

  String? searchText;

  String? searchPattern = '%%';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for switchh dynamic component.
  late FlutterFlowDynamicModels<SwitchhModel> switchhModels1;
  // Models for switchh dynamic component.
  late FlutterFlowDynamicModels<SwitchhModel> switchhModels2;

  @override
  void initState(BuildContext context) {
    switchhModels1 = FlutterFlowDynamicModels(() => SwitchhModel());
    switchhModels2 = FlutterFlowDynamicModels(() => SwitchhModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    switchhModels1.dispose();
    switchhModels2.dispose();
  }
}
