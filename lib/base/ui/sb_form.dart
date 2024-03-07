import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sobx/base/ui/ic.dart';

class MBPTextField extends StatelessWidget {
  const MBPTextField(
      {Key? key,
      this.title,
      this.hint,
      this.errorText,
      this.subTitle,
      this.controller,
      required this.onChanged,
      this.keyboardType,
      this.autoFocus = false,
      this.hintColor,
      this.readOnly = false,
      this.backgroundColor,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.text,
      this.textStyle,
      this.maxLine = 1,
      this.errorMaxLines = 1,
      this.borderColor,
      this.isRequired = false,
      this.suffixTitle,
      this.crossTitle,
      this.textCapitalization,
      this.inputFormater,
      this.maxLenght,
      this.textInputAction,
      this.debounceTime,
      this.isDisable = false,
      this.onFieldSubmitted,
      this.focusNode,
      this.validator,
      this.autovalidateMode,
      this.isMarginLeft = true,
      this.enable,
      this.focusedBorder = false,
      this.styleTitle,
      this.subTextTitle})
      : super(key: key);

  final String? title;
  final String? hint;
  final String? errorText;
  final String? subTitle;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final bool autoFocus;
  final Color? hintColor;
  final bool readOnly;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onTap;
  final String? text;
  final TextStyle? textStyle;
  final int? maxLine;
  final int? errorMaxLines;
  final Color? borderColor;
  final bool isRequired;
  final Widget? suffixTitle;
  final CrossAxisAlignment? crossTitle;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormater;
  final int? maxLenght;
  final TextInputAction? textInputAction;
  final int? debounceTime;
  final bool isDisable;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final bool? isMarginLeft;
  final bool? enable;

  final bool? focusedBorder;
  final TextStyle? styleTitle;

  final String? subTextTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: isMarginLeft == true ? 12 : 0),
                child: Row(
                  crossAxisAlignment: crossTitle ?? CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: title ?? '',
                          style: styleTitle ?? const TextStyle(fontSize: 14),
                          children: [
                            TextSpan(
                              text: subTextTitle ?? '',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (suffixTitle != null) suffixTitle!,
                    if (isRequired)
                      const Text(
                        ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.red),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        TextFormField(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          onChanged: (value) {
            onChanged(value);
          },
          textAlign: focusedBorder == true ? TextAlign.center : TextAlign.start,
          textInputAction: textInputAction,
          inputFormatters: inputFormater ??
              (keyboardType == TextInputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : []),
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: controller,
          keyboardType: keyboardType,
          autofocus: autoFocus,
          readOnly: isDisable ? isDisable : readOnly,
          initialValue: text,
          maxLength: maxLenght,
          onFieldSubmitted: (value) {
            if (onFieldSubmitted != null) {
              onFieldSubmitted!(value);
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          focusNode: focusNode,
          onEditingComplete: () {},
          style: textStyle ??
              const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
          key: Key(text ?? ''),
          maxLines: maxLine,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint ?? '',
              counterStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              hintStyle:
                  TextStyle(fontSize: 14, color: hintColor ?? Colors.black54),
              enabledBorder: focusedBorder == true
                  ? null
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: borderColor ?? Colors.transparent),
                    ),
              focusedBorder: focusedBorder == true
                  ? null
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: borderColor ?? Colors.transparent),
                    ),
              filled: true,
              errorBorder: focusedBorder == true
                  ? null
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: borderColor ?? Colors.black87),
                    ),
              focusedErrorBorder: focusedBorder == true
                  ? null
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: borderColor ?? Colors.black87),
                    ),
              errorText: errorText == '' ? null : errorText,
              errorMaxLines: errorMaxLines,
              errorStyle: const TextStyle(fontSize: 12, color: Colors.black87),
              fillColor: Colors.grey[200]),
          validator: validator,
          autovalidateMode: autovalidateMode,
          enabled: enable ?? true,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            subTitle ?? '',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        )
      ],
    );
  }
}

class MBPPassWordTextField extends StatefulWidget {
  const MBPPassWordTextField(
      {Key? key,
      this.title,
      this.hint,
      this.errorText,
      this.subTitle,
      this.controller,
      required this.onChanged,
      this.keyboardType,
      this.isRequired = false,
      this.maxLenght,
      this.inputFormatters,
      this.textStyle})
      : super(key: key);

  final String? title;
  final String? hint;
  final String? errorText;
  final String? subTitle;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final bool isRequired;
  final int? maxLenght;
  final List<FilteringTextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;

  @override
  State<MBPPassWordTextField> createState() => _MBPPassWordTextFieldState();
}

class _MBPPassWordTextFieldState extends State<MBPPassWordTextField> {
  bool obscureText = true;
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      widget.title ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (widget.isRequired)
                      const Text(
                        ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.red),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        TextFormField(
          onChanged: (value) {
            widget.onChanged(value);
            setState(() {
              currentText = value;
            });
          },
          keyboardType: widget.keyboardType ?? TextInputType.number,
          controller: widget.controller,
          obscureText: obscureText,
          // maxLength: widget.maxLenght ?? 20,
          inputFormatters: widget.inputFormatters,
          style: widget.textStyle ??
              const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_rounded,
                color: Colors.black54,
                size: 20,
              ),
              suffixIcon: currentText == ''
                  ? const SizedBox()
                  : IconButton(
                      icon: MbpImage(
                        name: obscureText ? 'ic_pass' : 'ic_hide_pass',
                        width: 24,
                        height: 14,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
              hintText: widget.hint ?? '',
              counterStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black54),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorText: (widget.errorText == '' || widget.errorText == null)
                  ? null
                  : widget.errorText,
              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
              fillColor: Colors.grey[200]),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            widget.subTitle ?? '',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        )
      ],
    );
  }
}

class MBPDropDownButton extends StatelessWidget {
  const MBPDropDownButton(
      {Key? key,
      this.title,
      this.hint,
      this.errorText,
      this.subTitle,
      this.controller,
      required this.onTap,
      this.keyboardType,
      this.value,
      this.isActive = false,
      this.suffixIcon,
      this.color,
      this.isRequired = false,
      this.paddingTitle,
      this.customRightView,
      this.prefixIcon,
      this.isDisable = false})
      : super(key: key);

  final String? title;
  final String? hint;
  final String? errorText;
  final String? subTitle;
  final TextEditingController? controller;
  final Function() onTap;
  final TextInputType? keyboardType;
  final String? value;
  final bool isActive;
  final String? suffixIcon;
  final Color? color;
  final bool isRequired;
  final EdgeInsetsGeometry? paddingTitle;
  final Widget? customRightView;
  final Widget? prefixIcon;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Column(
            children: [
              Container(
                padding: paddingTitle ?? const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      title ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (isRequired)
                      const Text(
                        ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.red),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        TextFormField(
          onTap: () {
            onTap();
          },
          key: Key(value.toString()),
          initialValue: value,
          controller: controller,
          keyboardType: keyboardType,
          readOnly: true,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: isDisable ? Colors.black26 : Colors.black87),
          decoration: InputDecoration(
              hintText: hint ?? '',
              prefixIcon: prefixIcon,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: customRightView ??
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 32,
                        color: Colors.black54,
                      ),
                ),
              ),
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: isActive ? Colors.black87 : Colors.black54),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorText: errorText == '' ? null : errorText,
              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
              fillColor:
                  isDisable ? Colors.black26 : color ?? Colors.grey[200]),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            subTitle ?? '',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        )
      ],
    );
  }
}
