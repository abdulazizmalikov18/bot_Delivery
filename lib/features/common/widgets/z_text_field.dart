import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/features/common/widgets/stroke_paint.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ZTextFormField extends StatefulWidget {
  final bool? hasBorderColor;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validate;
  final Color? disabledBorderColor;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final bool? hideCounterText;
  final Widget? prefixIcon;
  final EdgeInsets? prefixPadding;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final bool? isObscure;
  final Widget? suffix;
  final String? suffixIcon;
  final EdgeInsets? suffixPadding;
  final TextCapitalization textCapitalization;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final EdgeInsets? contentPadding;
  final bool hasError;
  final EdgeInsets? margin;
  final VoidCallback? onEyeTap;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function? onObscure;
  final Function? onTapSuffix;
  final Function()? onEditCompleted;
  final Function()? onTap;
  final bool autoFocus;
  final double? suffixRightPosition;
  final double? suffixSize;
  final int? maxLines;
  final bool? hasSearch;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusColor;
  final bool readOnly;
  final Widget? suffixTitleWidget;

  const ZTextFormField({
    required this.onChanged,
    this.controller,
    this.hasBorderColor,
    this.readOnly = false,
    this.hasSearch,
    this.validate,
    this.autoValidateMode,
    this.hideCounterText,
    this.autoFocus = false,
    this.disabledBorderColor,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.contentPadding = const EdgeInsets.all(12),
    this.prefixIcon,
    this.prefixPadding = const EdgeInsets.all(2),
    this.suffix,
    this.suffixIcon,
    this.suffixPadding = const EdgeInsets.all(8),
    this.isObscure,
    this.onEyeTap,
    this.margin,
    this.hasError = false,
    this.textInputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.keyBoardType,
    this.maxLength,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.onObscure,
    this.onTapSuffix,
    this.onEditCompleted,
    this.onTap,
    this.suffixRightPosition,
    this.suffixSize,
    this.maxLines = 1,
    this.borderColor,
    this.enabledBorderColor,
    this.focusColor,
    this.suffixTitleWidget,
    Key? key,
  }) : super(key: key);

  @override
  State<ZTextFormField> createState() => _ZTextFormFieldState();
}

class _ZTextFormFieldState extends State<ZTextFormField>
    with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  bool focused = false;
  bool hasText = false;
  bool isObscure = false;
  bool showStroke = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animationController.forward();

    super.initState();
    if (widget.isObscure != null) {
      isObscure = widget.isObscure!;
    }
    focusNode = FocusNode();

    focusNode.addListener(
      () => setState(() {
        focused = !focused;
      }),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          TextFormField(
            focusNode: widget.focusNode ?? focusNode,
            onChanged: (s) {
              setState(() => hasText = s.isNotEmpty);
              widget.onChanged(s);
            },
            autovalidateMode: widget.autoValidateMode,
            validator: widget.validate,
            maxLines: isObscure ? 1 : widget.maxLines,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            textAlign: widget.textAlign,
            inputFormatters: widget.textInputFormatters,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            obscureText: isObscure,
            keyboardType: widget.keyBoardType,
            maxLength: widget.maxLength,
            controller: widget.controller,
            autofocus: widget.autoFocus,
            cursorColor: dark,
            cursorHeight: 18,
            cursorWidth: 1,
            onEditingComplete: widget.onEditCompleted,
            style: widget.textStyle ??
                Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              fillColor: const Color(0xFFF5F5F5),
              filled: true,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: widget.hasError ? red : whiteSmoke),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: widget.hasError ? red : blue),
              ),
              suffix: widget.suffix != null
                  ? SizedBox(width: widget.suffixSize)
                  : null,
              counterText:
                  widget.hideCounterText != null && widget.hideCounterText!
                      ? ''
                      : null,
              prefixIconConstraints: const BoxConstraints(maxWidth: 70),
              contentPadding: const EdgeInsets.only(
                  top: 14, bottom: 14, left: 16, right: 36),
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle ??
                  Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            right: 8,
            child: widget.isObscure == null
                ? widget.suffixIcon != null
                    ? WScaleAnimation(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 2, 6),
                          child: SvgPicture.asset(
                            widget.suffixIcon!,
                          ),
                        ),
                      )
                    : const SizedBox()
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                      if (isObscure) {
                        animationController.forward();
                      } else {
                        animationController.reverse();
                      }
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 12),
                      child: Center(
                        child: AnimatedBuilder(
                          animation: animationController,
                          child: SvgPicture.asset(AppIcons.eye),
                          builder: (context, child) => SizedBox(
                            width: 24,
                            height: 24,
                            child: CustomPaint(
                              foregroundPainter:
                                  StrokePaint(animationController.value),
                              child: child,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
}
