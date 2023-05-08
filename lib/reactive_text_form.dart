library reactive_text_form;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_text_form/valueobjects/i_value_object.dart';
import 'package:reactive_text_form/valueobjects/typedef.dart';
import 'package:reactive_text_form/valueobjects/value_objects.dart';

class ReactiveTextForm extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? error;
  final List<ValueValidator>? validators;

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final bool? enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  const ReactiveTextForm({
    super.key,
    this.onChanged,
    this.error,
    this.validators,

    // From here TextForm values
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    @Deprecated(
      'Use `contextMenuBuilder` instead. '
      'This feature was deprecated after v3.3.0-0.5.pre.',
    )
        this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.enableIMEPersonalizedLearning,
    this.mouseCursor,
    this.contextMenuBuilder,
  });

  @override
  State<ReactiveTextForm> createState() => _ReactiveTextFormState();
}

class _ReactiveTextFormState extends State<ReactiveTextForm> {
  late IValueObject valueObject;

  @override
  void initState() {
    valueObject = _getValueObject('');
    super.initState();
  }

  ValueObject _getValueObject(
    String value,
  ) {
    return ValueObject(
      value,
      widget.validators ?? [_defaultValueValidator],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _getInputDecoration(),
      onChanged: (value) {
        setState(() {
          valueObject = _getValueObject(value);
        });
        widget.onChanged?.call(value);
      },
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: widget.textInputAction,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign ?? TextAlign.start,
      textAlignVertical: widget.textAlignVertical,
      autofocus: widget.autofocus ?? false,
      readOnly: widget.readOnly ?? false,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      obscuringCharacter: widget.obscuringCharacter ?? '•',
      obscureText: widget.obscureText ?? false,
      autocorrect: widget.autocorrect ?? false,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions ?? true,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      expands: widget.expands ?? false,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth ?? 2.0,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      autovalidateMode: widget.autovalidateMode,
      scrollController: widget.scrollController,
      enableIMEPersonalizedLearning:
          widget.enableIMEPersonalizedLearning ?? true,
      mouseCursor: widget.mouseCursor,
      contextMenuBuilder:
          widget.contextMenuBuilder ?? _defaultContextMenuBuilder,
    );
  }

  InputDecoration _getInputDecoration() {
    final decoration = widget.decoration;
    if (widget.decoration == null) {
      return InputDecoration(
        errorText: _getErrorText(),
      );
    }

    return InputDecoration(
      icon: decoration!.icon,
      iconColor: decoration.iconColor,
      label: decoration.label,
      labelText: decoration.labelText,
      labelStyle: decoration.labelStyle,
      floatingLabelStyle: decoration.floatingLabelStyle,
      helperText: decoration.helperText,
      helperStyle: decoration.helperStyle,
      helperMaxLines: decoration.helperMaxLines,
      hintText: decoration.hintText,
      hintStyle: decoration.hintStyle,
      hintTextDirection: decoration.hintTextDirection,
      hintMaxLines: decoration.hintMaxLines,
      errorText: _getErrorText(),
      errorStyle: decoration.errorStyle,
      errorMaxLines: decoration.errorMaxLines,
      floatingLabelBehavior: decoration.floatingLabelBehavior,
      floatingLabelAlignment: decoration.floatingLabelAlignment,
      isCollapsed: decoration.isCollapsed,
      isDense: decoration.isDense,
      contentPadding: decoration.contentPadding,
      prefixIcon: decoration.prefixIcon,
      prefixIconConstraints: decoration.prefixIconConstraints,
      prefix: decoration.prefix,
      prefixText: decoration.prefixText,
      prefixStyle: decoration.prefixStyle,
      prefixIconColor: decoration.prefixIconColor,
      suffixIcon: decoration.suffixIcon,
      suffix: decoration.suffix,
      suffixText: decoration.suffixText,
      suffixStyle: decoration.suffixStyle,
      suffixIconColor: decoration.suffixIconColor,
      suffixIconConstraints: decoration.suffixIconConstraints,
      counter: decoration.counter,
      counterText: decoration.counterText,
      counterStyle: decoration.counterStyle,
      filled: decoration.filled,
      fillColor: decoration.fillColor,
      focusColor: decoration.focusColor,
      hoverColor: decoration.hoverColor,
      errorBorder: decoration.errorBorder,
      focusedBorder: decoration.focusedBorder,
      focusedErrorBorder: decoration.focusedErrorBorder,
      disabledBorder: decoration.disabledBorder,
      enabledBorder: decoration.enabledBorder,
      border: decoration.border,
      enabled: decoration.enabled,
      semanticCounterText: decoration.semanticCounterText,
      alignLabelWithHint: decoration.alignLabelWithHint,
      constraints: decoration.constraints,
    );
  }

  String? _getErrorText() {
    if (widget.validators == null) {
      return null;
    }
    if (valueObject.isValid() == true || valueObject.input.isEmpty == true) {
      return null;
    }
    return widget.error;
  }
}

String? _defaultValueValidator(String input) {
  if (input.isNotEmpty && input.length < 2) {
    return 'Invalid value';
  }
  return null;
}

Widget _defaultContextMenuBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.editableText(
    editableTextState: editableTextState,
  );
}
