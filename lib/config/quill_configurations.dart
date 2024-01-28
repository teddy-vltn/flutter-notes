import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillConfigurations {
  static QuillController getController({required String jsonContent}) {
    return QuillController(
      document: Document.fromJson(jsonDecode(jsonContent)),
      selection: TextSelection.collapsed(offset: 0),
    );
  }

  static QuillEditorConfigurations getEditorConfigurations({required QuillController controller}) {
    return QuillEditorConfigurations(
      controller: controller,
      readOnly: false,
      sharedConfigurations: const QuillSharedConfigurations(
        locale: Locale('fr'),
      ),
    );
  }

  static QuillSimpleToolbarConfigurations getToolbarConfigurations({required QuillController controller}) {
    return QuillSimpleToolbarConfigurations(
      toolbarSize: 40,
      controller: controller,
      multiRowsDisplay: false,
      showColorButton: false,
      showBackgroundColorButton: false,
      showUnderLineButton: true,
      showStrikeThrough: true,
      showDividers: false,
      showFontFamily: false,
      showDirection: false,
      showInlineCode: false,
      showListCheck: true,
      showClearFormat: true,
      showSubscript: false,
      showSuperscript: false,
      showSearchButton: false,
      showSmallButton: false,
    );
  }
}
