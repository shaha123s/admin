import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switchh_model.dart';
export 'switchh_model.dart';

class SwitchhWidget extends StatefulWidget {
  const SwitchhWidget({
    super.key,
    required this.idusewr,
    required this.status,
  });

  final String? idusewr;
  final String? status;

  @override
  State<SwitchhWidget> createState() => _SwitchhWidgetState();
}

class _SwitchhWidgetState extends State<SwitchhWidget> {
  late SwitchhModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchhModel());

    _model.switchValue = widget!.status == 'active';
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        safeSetState(() => _model.switchValue = newValue!);
        if (newValue!) {
          await UsersTable().update(
            data: {
              'status': 'active',
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              widget!.idusewr,
            ),
          );

          safeSetState(() {});
        } else {
          await UsersTable().update(
            data: {
              'status': 'inactive',
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              widget!.idusewr,
            ),
          );

          safeSetState(() {});
        }
      },
      activeColor: Color(0xFF0C854F),
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
    );
  }
}
